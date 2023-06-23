// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notepaddata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotePadDataAdapter extends TypeAdapter<NotePadData> {
  @override
  final int typeId = 0;

  @override
  NotePadData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotePadData()
      ..title = fields[0] as String?
      ..note = fields[1] as String?
      ..createdAt = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, NotePadData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotePadDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
