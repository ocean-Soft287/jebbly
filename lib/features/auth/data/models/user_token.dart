import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user_token.g.dart';
@HiveType(typeId: 1)
class UserToken extends Equatable {
  @HiveField(0)
  final String accessToken;

  const UserToken({
    required this.accessToken,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      accessToken: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
    };
  }

  @override
  List<Object?> get props => [
        accessToken,
      ];
}
