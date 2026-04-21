// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 21;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      serviceId: fields[0] as int?,
      restaurantId: fields[1] as int,
      id: fields[2] as int,
      nameAr: fields[3] as String,
      nameEn: fields[4] as String,
      descriptionAr: fields[5] as String,
      descriptionEn: fields[6] as String,
      isActive: fields[7] as bool,
      imageUrl: fields[8] as String,
      price: fields[9] as double,
      categoryId: fields[10] as int,
      categoryName: fields[11] as String,
      quantity: fields[12] as double,
      subCategoryId: fields[13] as int?,
      subCategoryName: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.serviceId)
      ..writeByte(1)
      ..write(obj.restaurantId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.nameAr)
      ..writeByte(4)
      ..write(obj.nameEn)
      ..writeByte(5)
      ..write(obj.descriptionAr)
      ..writeByte(6)
      ..write(obj.descriptionEn)
      ..writeByte(7)
      ..write(obj.isActive)
      ..writeByte(8)
      ..write(obj.imageUrl)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.categoryId)
      ..writeByte(11)
      ..write(obj.categoryName)
      ..writeByte(12)
      ..write(obj.quantity)
      ..writeByte(13)
      ..write(obj.subCategoryId)
      ..writeByte(14)
      ..write(obj.subCategoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
