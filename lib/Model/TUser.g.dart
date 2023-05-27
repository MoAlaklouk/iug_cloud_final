// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TUser.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TUserAdapter extends TypeAdapter<TUser> {
  @override
  final int typeId = 1;

  @override
  TUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TUser(
      name: fields[0] as String?,
      password: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TUser obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
