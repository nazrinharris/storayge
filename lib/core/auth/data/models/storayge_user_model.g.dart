// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storayge_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoraygeUserModelAdapter extends TypeAdapter<StoraygeUserModel> {
  @override
  final int typeId = 0;

  @override
  StoraygeUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoraygeUserModel(
      uid: fields[2] as String,
      username: fields[0] as String,
      email: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StoraygeUserModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoraygeUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
