import 'package:equatable/equatable.dart';

// ── Working hours model ──
class WorkingHoursModel extends Equatable {
  final String day;
  final String openAt;
  final String closeAt;

  const WorkingHoursModel({
    required this.day,
    required this.openAt,
    required this.closeAt,
  });

  factory WorkingHoursModel.fromJson(Map<String, dynamic> json) =>
      WorkingHoursModel(
        day: json['day'] as String? ?? '',
        openAt: json['openAt'] as String? ?? '',
        closeAt: json['closeAt'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
    'day': day,
    'openAt': openAt,
    'closeAt': closeAt,
  };

  WorkingHoursModel copyWith({
    String? day,
    String? openAt,
    String? closeAt,
  }) =>
      WorkingHoursModel(
        day: day ?? this.day,
        openAt: openAt ?? this.openAt,
        closeAt: closeAt ?? this.closeAt,
      );

  @override
  List<Object?> get props => [day, openAt, closeAt];
}

// ─────────────────────────────────────────────────────────────

class RestaurantDetailsModel extends Equatable {
  final int id;
  final int serviceId;
  final String nameAr;
  final String nameEn;
  final String addressAr;
  final String addressEn;
  final String resturantsStatus;
  final double latitude;
  final double longitude;
  final String? notes;
  final String? foodType;
  final int areaId;
  final String? areaName;
  final double rate;
  final String logo;
  final String coverUrl;
  final double taxPercentage;
  final int minDeliveryTime;
  final int maxDeliveryTime;
  final String ownerFirstName;
  final String ownerLastName;
  final String? ownerPhone;
  final String ownerEmail;

  // ── New fields (pending backend) ──
  final double? deliveryFee;
  final double? minimumOrderAmount;
  final String? currency;
  final double? distanceKm;
  final List<WorkingHoursModel>? workingHours;

  const RestaurantDetailsModel({
    required this.id,
    required this.serviceId,
    required this.nameAr,
    required this.nameEn,
    required this.addressAr,
    required this.addressEn,
    required this.resturantsStatus,
    required this.latitude,
    required this.longitude,
    this.notes,
    this.foodType,
    required this.areaId,
    this.areaName,
    required this.rate,
    required this.logo,
    required this.coverUrl,
    required this.taxPercentage,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.ownerFirstName,
    required this.ownerLastName,
    this.ownerPhone,
    required this.ownerEmail,
    // ── New fields ──
    this.deliveryFee,
    this.minimumOrderAmount,
    this.currency,
    this.distanceKm,
    this.workingHours,
  });

  factory RestaurantDetailsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailsModel(
      id: json['id'] as int,
      serviceId: json['serviceId'] as int,
      nameAr: json['nameAr'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      addressAr: json['addressAr'] as String? ?? '',
      addressEn: json['addressEn'] as String? ?? '',
      resturantsStatus: json['resturantsStatus'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String?,
      foodType: json['foodType'] as String?,
      areaId: json['areaId'] as int? ?? 0,
      areaName: json['areaName'] as String?,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      logo: json['logo'] as String? ?? '',
      coverUrl: json['coverUrl'] as String? ?? '',
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble() ?? 0.0,
      minDeliveryTime: json['minDeliveryTime'] as int? ?? 0,
      maxDeliveryTime: json['maxDeliveryTime'] as int? ?? 0,
      ownerFirstName: json['ownerFirstName'] as String? ?? '',
      ownerLastName: json['ownerLastName'] as String? ?? '',
      ownerPhone: json['ownerPhone'] as String?,
      ownerEmail: json['ownerEmail'] as String? ?? '',
      // ── New fields ──
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      minimumOrderAmount: (json['minimumOrderAmount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      workingHours: (json['workingHours'] as List<dynamic>?)
          ?.map((e) => WorkingHoursModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'serviceId': serviceId,
    'nameAr': nameAr,
    'nameEn': nameEn,
    'addressAr': addressAr,
    'addressEn': addressEn,
    'resturantsStatus': resturantsStatus,
    'latitude': latitude,
    'longitude': longitude,
    'notes': notes,
    'foodType': foodType,
    'areaId': areaId,
    'areaName': areaName,
    'rate': rate,
    'logo': logo,
    'coverUrl': coverUrl,
    'taxPercentage': taxPercentage,
    'minDeliveryTime': minDeliveryTime,
    'maxDeliveryTime': maxDeliveryTime,
    'ownerFirstName': ownerFirstName,
    'ownerLastName': ownerLastName,
    'ownerPhone': ownerPhone,
    'ownerEmail': ownerEmail,
    // ── New fields ──
    'deliveryFee': deliveryFee,
    'minimumOrderAmount': minimumOrderAmount,
    'currency': currency,
    'distanceKm': distanceKm,
    'workingHours': workingHours?.map((e) => e.toJson()).toList(),
  };

  RestaurantDetailsModel copyWith({
    int? id,
    int? serviceId,
    String? nameAr,
    String? nameEn,
    String? addressAr,
    String? addressEn,
    String? resturantsStatus,
    double? latitude,
    double? longitude,
    String? notes,
    String? foodType,
    int? areaId,
    String? areaName,
    double? rate,
    String? logo,
    String? coverUrl,
    double? taxPercentage,
    int? minDeliveryTime,
    int? maxDeliveryTime,
    String? ownerFirstName,
    String? ownerLastName,
    String? ownerPhone,
    String? ownerEmail,
    // ── New fields ──
    double? deliveryFee,
    double? minimumOrderAmount,
    String? currency,
    double? distanceKm,
    List<WorkingHoursModel>? workingHours,
  }) =>
      RestaurantDetailsModel(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        addressAr: addressAr ?? this.addressAr,
        addressEn: addressEn ?? this.addressEn,
        resturantsStatus: resturantsStatus ?? this.resturantsStatus,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        notes: notes ?? this.notes,
        foodType: foodType ?? this.foodType,
        areaId: areaId ?? this.areaId,
        areaName: areaName ?? this.areaName,
        rate: rate ?? this.rate,
        logo: logo ?? this.logo,
        coverUrl: coverUrl ?? this.coverUrl,
        taxPercentage: taxPercentage ?? this.taxPercentage,
        minDeliveryTime: minDeliveryTime ?? this.minDeliveryTime,
        maxDeliveryTime: maxDeliveryTime ?? this.maxDeliveryTime,
        ownerFirstName: ownerFirstName ?? this.ownerFirstName,
        ownerLastName: ownerLastName ?? this.ownerLastName,
        ownerPhone: ownerPhone ?? this.ownerPhone,
        ownerEmail: ownerEmail ?? this.ownerEmail,
        // ── New fields ──
        deliveryFee: deliveryFee ?? this.deliveryFee,
        minimumOrderAmount: minimumOrderAmount ?? this.minimumOrderAmount,
        currency: currency ?? this.currency,
        distanceKm: distanceKm ?? this.distanceKm,
        workingHours: workingHours ?? this.workingHours,
      );

  // ── Helper: is restaurant currently open ──
  bool get isOpenNow {
    if (workingHours == null || workingHours!.isEmpty) return false;

    final now = DateTime.now();
    final days = [
      'Monday', 'Tuesday', 'Wednesday',
      'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    final todayName = days[now.weekday - 1];

    final todayHours = workingHours!.where(
          (e) => e.day.toLowerCase() == todayName.toLowerCase(),
    );

    if (todayHours.isEmpty) return false;

    final schedule = todayHours.first;

    final openParts = schedule.openAt.split(':');
    final closeParts = schedule.closeAt.split(':');

    final openTime = DateTime(now.year, now.month, now.day,
        int.parse(openParts[0]), int.parse(openParts[1]));
    final closeTime = DateTime(now.year, now.month, now.day,
        int.parse(closeParts[0]), int.parse(closeParts[1]));

    return now.isAfter(openTime) && now.isBefore(closeTime);
  }

  // ── Helper: currency with fallback ──
  String get currencyLabel => currency ?? 'د.ل';

  @override
  List<Object?> get props => [
    id, serviceId, nameAr, nameEn, addressAr, addressEn,
    resturantsStatus, latitude, longitude, notes, foodType,
    areaId, areaName, rate, logo, coverUrl, taxPercentage,
    minDeliveryTime, maxDeliveryTime, ownerFirstName,
    ownerLastName, ownerPhone, ownerEmail,
    // ── New fields ──
    deliveryFee, minimumOrderAmount, currency, distanceKm, workingHours,
  ];
}