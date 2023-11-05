// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoItemImplAdapter extends TypeAdapter<_$ToDoItemImpl> {
  @override
  final int typeId = 1;

  @override
  _$ToDoItemImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ToDoItemImpl(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ToDoItemImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.priorityType)
      ..writeByte(6)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoItemImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoItemImpl _$$ToDoItemImplFromJson(Map<String, dynamic> json) =>
    _$ToDoItemImpl(
      json['id'] as String,
      json['title'] as String,
      json['desc'] as String?,
      json['date'] as String?,
      json['time'] as String?,
      json['priority_type'] as String?,
      json['isDone'] as bool?,
    );

Map<String, dynamic> _$$ToDoItemImplToJson(_$ToDoItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'date': instance.date,
      'time': instance.time,
      'priority_type': instance.priorityType,
      'isDone': instance.isDone,
    };
