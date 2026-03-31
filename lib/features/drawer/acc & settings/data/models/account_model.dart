import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final String id;
  final String fullName;
  final String? email;
  final String phoneNumber;
  final String? imageUrl;

  const AccountModel({
    required this.id,
    required this.fullName,
    this.email,
    required this.phoneNumber,
    this.imageUrl,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [id, fullName, email, phoneNumber, imageUrl];
}
