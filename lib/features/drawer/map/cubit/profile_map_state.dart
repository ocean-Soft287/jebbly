sealed class ProfileMapState {}

final class ProfileMapInitial extends ProfileMapState {}

final class SearchSuccessState extends ProfileMapState {}

final class LocationUpdatedState extends ProfileMapState {}

final class MapControllerUpdatedState extends ProfileMapState {}

final class SearchFailureState extends ProfileMapState {
  final String errorMessage;
  SearchFailureState(this.errorMessage);
}