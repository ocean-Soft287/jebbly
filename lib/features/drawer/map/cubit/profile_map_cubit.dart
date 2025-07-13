import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/drawer/map/cubit/profile_map_state.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeebly_mobile/core/helpers/functions/custom_logger.dart';
import 'package:location/location.dart' as location;

class ProfileMapCubit extends Cubit<ProfileMapState> {
  ProfileMapCubit() : super(ProfileMapInitial());

  static ProfileMapCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  LatLng? currentP;
  GoogleMapController? mapController;
  final location.Location _locationController = location.Location();

  bool isTrackingLocation = true; // Controls location tracking
  String deliveryLocation = ''; // Stores the address

  /// Gets an address from a LatLng position
  Future<String> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {
      CustomLogger.logger.e("Error getting address: $e");
    }
    return "Unknown location";
  }

  /// Initializes and listens for location updates
  Future<void> getLocationUpdates() async {
    bool serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) return;
    }

    location.PermissionStatus permissionGranted =
        await _locationController.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != location.PermissionStatus.granted) return;
    }

    _locationController.onLocationChanged
        .listen((location.LocationData currentLocation) async {
      if (isTrackingLocation &&
          currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        currentP =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);

        // Get the address and update deliveryLocation
        deliveryLocation = await getAddressFromLatLng(currentP!);
        if (!isClosed) emit(LocationUpdatedState());
      }
    });
  }

  /// Detects and moves to the user's current location
  Future<void> detectMyLocation() async {
    isTrackingLocation = true; // Resume tracking

    bool serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) return;
    }

    location.PermissionStatus permissionGranted =
        await _locationController.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != location.PermissionStatus.granted) return;
    }

    try {
      location.LocationData currentLocation =
          await _locationController.getLocation();
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        currentP =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);

        // Get the address and update deliveryLocation
        deliveryLocation = await getAddressFromLatLng(currentP!);
        CustomLogger.logger.i("Current Address: $deliveryLocation");

        mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentP!, 15));

        emit(LocationUpdatedState());
      }
    } catch (e) {
      CustomLogger.logger.e("Error detecting location: $e");
      emit(SearchFailureState(e.toString()));
    }
  }

  /// Searches for a location and updates the map
  Future<void> searchLocation(String? locationQuery) async {
    try {
      isTrackingLocation = false; // Stop tracking while searching
      String query = locationQuery ?? searchController.text.trim();
      if (query.isEmpty) return;

      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        LatLng newLocation =
            LatLng(locations.first.latitude, locations.first.longitude);
        currentP = newLocation;

        // Get the address and update deliveryLocation
        deliveryLocation = await getAddressFromLatLng(currentP!);
        CustomLogger.logger.i("Searched Address: $deliveryLocation");

        mapController
            ?.animateCamera(CameraUpdate.newLatLngZoom(newLocation, 12));

        emit(LocationUpdatedState());
      }
    } catch (e) {
      CustomLogger.logger.e("Error searching location: $e");
      emit(SearchFailureState(e.toString()));
    }
  }

  /// Updates the Google Map Controller when the map is created
  void setMapController(GoogleMapController controller) {
    mapController = controller;
    emit(MapControllerUpdatedState());
  }

  @override
  Future<void> close() {
    // Stop listening for location updates
    _locationController.onLocationChanged.drain();

    // Dispose of the search controller
    // searchController.dispose();
    searchController.clear();

    return super.close();
  }
}