// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchRestaurantModelAdapter extends TypeAdapter<SearchRestaurantModel> {
  @override
  final int typeId = 20;

  @override
  SearchRestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchRestaurantModel(
      id: fields[0] as int,
      nameAr: fields[1] as String,
      nameEn: fields[2] as String,
      logo: fields[3] as String,
      rating: fields[4] as double?,
      minDeliveryTime: fields[5] as int,
      maxDeliveryTime: fields[6] as int,
      averagePreparationTime: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SearchRestaurantModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameAr)
      ..writeByte(2)
      ..write(obj.nameEn)
      ..writeByte(3)
      ..write(obj.logo)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.minDeliveryTime)
      ..writeByte(6)
      ..write(obj.maxDeliveryTime)
      ..writeByte(7)
      ..write(obj.averagePreparationTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchRestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
