class AddressModel {
  final String? title;
  final String? details;
  final String? lng;
  final String? lat;

  const AddressModel({
    this.title,
    this.details,
    this.lng,
    this.lat,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      title: json['title'] as String?,
      details: json['details'] as String?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'details': details,
      'lng': lng,
      'lat': lat,
    };
  }
}
