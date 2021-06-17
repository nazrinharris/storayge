// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelfModelAdapter extends TypeAdapter<ShelfModel> {
  @override
  final int typeId = 1;

  @override
  ShelfModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelfModel(
      shelfName: fields[0] as String,
      shelfId: fields[1] as String,
      shelfDesc: fields[2] as String,
      imgPath: fields[3] as String,
      pathName: fields[4] as String,
      containerAmount: fields[5] as int,
      itemAmount: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ShelfModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.shelfName)
      ..writeByte(1)
      ..write(obj.shelfId)
      ..writeByte(2)
      ..write(obj.shelfDesc)
      ..writeByte(3)
      ..write(obj.imgPath)
      ..writeByte(4)
      ..write(obj.pathName)
      ..writeByte(5)
      ..write(obj.containerAmount)
      ..writeByte(6)
      ..write(obj.itemAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
