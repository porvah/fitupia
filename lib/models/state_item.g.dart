// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StateItemAdapter extends TypeAdapter<StateItem> {
  @override
  final int typeId = 2;

  @override
  StateItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StateItem(
      title: fields[0] as String,
      value: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, StateItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
