// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todolistdata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoListDataAdapter extends TypeAdapter<TodoListData> {
  @override
  final int typeId = 1;

  @override
  TodoListData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoListData()
      ..todo = fields[0] as String?
      ..done = fields[1] as bool?
      ..createdAt = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, TodoListData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.todo)
      ..writeByte(1)
      ..write(obj.done)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoListDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
