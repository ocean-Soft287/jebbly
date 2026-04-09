class AddressModel {
  final int? id;
  final String? title;
  final String? details;
  final String? governorate;
  final String? district;

  const AddressModel({
    this.id,
    this.title,
    this.details,
    this.governorate,
    this.district,
  });

  String? get lng => governorate;
  String? get lat => district;

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      details: json['details'] as String?,
      governorate: json['lng'] as String?,
      district: json['lat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'details': details,
      'governorate': governorate,
      'district': district,
    };
  }
}
