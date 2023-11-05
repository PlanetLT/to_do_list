
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'to_do_item.freezed.dart';
part 'to_do_item.g.dart';

@freezed
class ToDoItem with _$ToDoItem {
  @HiveType(typeId: 1)
  const factory ToDoItem(
    @JsonKey(name: "id") @HiveField(0) String id,
    @JsonKey(name: "title") @HiveField(1) String title,
    @JsonKey(name: "desc") @HiveField(2) String? desc,
    @JsonKey(name: "date") @HiveField(3) String? date,
    @JsonKey(name: "time") @HiveField(4) String? time,
    @JsonKey(name: "priority_type") @HiveField(5) String? priorityType,
    @JsonKey(name: "isDone") @HiveField(6) bool? isDone ,
  ) = _ToDoItem;
  factory ToDoItem.fromJson(Map<String, dynamic> json) =>
      _$ToDoItemFromJson(json);
}
