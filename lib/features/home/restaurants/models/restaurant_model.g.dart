// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestaurantModelAdapter extends TypeAdapter<RestaurantModel> {
  @override
  final int typeId = 15;

  @override
  RestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantModel(
      id: fields[0] as int,
      serviceId: fields[1] as int,
      nameOfResturantAr: fields[2] as String?,
      nameOfResturantEn: fields[3] as String?,
      descriptionAr: fields[4] as String?,
      descriptionEn: fields[5] as String?,
      logo: fields[6] as String?,
      rate: fields[7] as double,
      nameOfResturantOwner: fields[8] as String?,
      areaOfResturantAr: fields[9] as String?,
      areaOfResturantEn: fields[10] as String?,
      status: fields[11] as String,
      categoryName: (fields[12] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.serviceId)
      ..writeByte(2)
      ..write(obj.nameOfResturantAr)
      ..writeByte(3)
      ..write(obj.nameOfResturantEn)
      ..writeByte(4)
      ..write(obj.descriptionAr)
      ..writeByte(5)
      ..write(obj.descriptionEn)
      ..writeByte(6)
      ..write(obj.logo)
      ..writeByte(7)
      ..write(obj.rate)
      ..writeByte(8)
      ..write(obj.nameOfResturantOwner)
      ..writeByte(9)
      ..write(obj.areaOfResturantAr)
      ..writeByte(10)
      ..write(obj.areaOfResturantEn)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.categoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
