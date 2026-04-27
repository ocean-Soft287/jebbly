import 'package:equatable/equatable.dart';

class AdModel extends Equatable {
  final int id;
  final String coverUrl;

  const AdModel({
    required this.id,
    required this.coverUrl,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['resturantid'] as int,
      coverUrl: json['coverUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coverUrl': coverUrl,
    };
  }

  @override
  List<Object?> get props => [id, coverUrl];
}
