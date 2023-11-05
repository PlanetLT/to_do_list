// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_do_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDoItem _$ToDoItemFromJson(Map<String, dynamic> json) {
  return _ToDoItem.fromJson(json);
}

/// @nodoc
mixin _$ToDoItem {
  @JsonKey(name: "id")
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "desc")
  @HiveField(2)
  String? get desc => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  @HiveField(3)
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  @HiveField(4)
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: "priority_type")
  @HiveField(5)
  String? get priorityType => throw _privateConstructorUsedError;
  @JsonKey(name: "isDone")
  @HiveField(6)
  bool? get isDone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoItemCopyWith<ToDoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoItemCopyWith<$Res> {
  factory $ToDoItemCopyWith(ToDoItem value, $Res Function(ToDoItem) then) =
      _$ToDoItemCopyWithImpl<$Res, ToDoItem>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") @HiveField(0) String id,
      @JsonKey(name: "title") @HiveField(1) String title,
      @JsonKey(name: "desc") @HiveField(2) String? desc,
      @JsonKey(name: "date") @HiveField(3) String? date,
      @JsonKey(name: "time") @HiveField(4) String? time,
      @JsonKey(name: "priority_type") @HiveField(5) String? priorityType,
      @JsonKey(name: "isDone") @HiveField(6) bool? isDone});
}

/// @nodoc
class _$ToDoItemCopyWithImpl<$Res, $Val extends ToDoItem>
    implements $ToDoItemCopyWith<$Res> {
  _$ToDoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? desc = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? priorityType = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityType: freezed == priorityType
          ? _value.priorityType
          : priorityType // ignore: cast_nullable_to_non_nullable
              as String?,
      isDone: freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoItemImplCopyWith<$Res>
    implements $ToDoItemCopyWith<$Res> {
  factory _$$ToDoItemImplCopyWith(
          _$ToDoItemImpl value, $Res Function(_$ToDoItemImpl) then) =
      __$$ToDoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") @HiveField(0) String id,
      @JsonKey(name: "title") @HiveField(1) String title,
      @JsonKey(name: "desc") @HiveField(2) String? desc,
      @JsonKey(name: "date") @HiveField(3) String? date,
      @JsonKey(name: "time") @HiveField(4) String? time,
      @JsonKey(name: "priority_type") @HiveField(5) String? priorityType,
      @JsonKey(name: "isDone") @HiveField(6) bool? isDone});
}

/// @nodoc
class __$$ToDoItemImplCopyWithImpl<$Res>
    extends _$ToDoItemCopyWithImpl<$Res, _$ToDoItemImpl>
    implements _$$ToDoItemImplCopyWith<$Res> {
  __$$ToDoItemImplCopyWithImpl(
      _$ToDoItemImpl _value, $Res Function(_$ToDoItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? desc = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? priorityType = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_$ToDoItemImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == priorityType
          ? _value.priorityType
          : priorityType // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$ToDoItemImpl implements _ToDoItem {
  const _$ToDoItemImpl(
      @JsonKey(name: "id") @HiveField(0) this.id,
      @JsonKey(name: "title") @HiveField(1) this.title,
      @JsonKey(name: "desc") @HiveField(2) this.desc,
      @JsonKey(name: "date") @HiveField(3) this.date,
      @JsonKey(name: "time") @HiveField(4) this.time,
      @JsonKey(name: "priority_type") @HiveField(5) this.priorityType,
      @JsonKey(name: "isDone") @HiveField(6) this.isDone);

  factory _$ToDoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToDoItemImplFromJson(json);

  @override
  @JsonKey(name: "id")
  @HiveField(0)
  final String id;
  @override
  @JsonKey(name: "title")
  @HiveField(1)
  final String title;
  @override
  @JsonKey(name: "desc")
  @HiveField(2)
  final String? desc;
  @override
  @JsonKey(name: "date")
  @HiveField(3)
  final String? date;
  @override
  @JsonKey(name: "time")
  @HiveField(4)
  final String? time;
  @override
  @JsonKey(name: "priority_type")
  @HiveField(5)
  final String? priorityType;
  @override
  @JsonKey(name: "isDone")
  @HiveField(6)
  final bool? isDone;

  @override
  String toString() {
    return 'ToDoItem(id: $id, title: $title, desc: $desc, date: $date, time: $time, priorityType: $priorityType, isDone: $isDone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.priorityType, priorityType) ||
                other.priorityType == priorityType) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, desc, date, time, priorityType, isDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoItemImplCopyWith<_$ToDoItemImpl> get copyWith =>
      __$$ToDoItemImplCopyWithImpl<_$ToDoItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToDoItemImplToJson(
      this,
    );
  }
}

abstract class _ToDoItem implements ToDoItem {
  const factory _ToDoItem(
      @JsonKey(name: "id") @HiveField(0) final String id,
      @JsonKey(name: "title") @HiveField(1) final String title,
      @JsonKey(name: "desc") @HiveField(2) final String? desc,
      @JsonKey(name: "date") @HiveField(3) final String? date,
      @JsonKey(name: "time") @HiveField(4) final String? time,
      @JsonKey(name: "priority_type") @HiveField(5) final String? priorityType,
      @JsonKey(name: "isDone")
      @HiveField(6)
      final bool? isDone) = _$ToDoItemImpl;

  factory _ToDoItem.fromJson(Map<String, dynamic> json) =
      _$ToDoItemImpl.fromJson;

  @override
  @JsonKey(name: "id")
  @HiveField(0)
  String get id;
  @override
  @JsonKey(name: "title")
  @HiveField(1)
  String get title;
  @override
  @JsonKey(name: "desc")
  @HiveField(2)
  String? get desc;
  @override
  @JsonKey(name: "date")
  @HiveField(3)
  String? get date;
  @override
  @JsonKey(name: "time")
  @HiveField(4)
  String? get time;
  @override
  @JsonKey(name: "priority_type")
  @HiveField(5)
  String? get priorityType;
  @override
  @JsonKey(name: "isDone")
  @HiveField(6)
  bool? get isDone;
  @override
  @JsonKey(ignore: true)
  _$$ToDoItemImplCopyWith<_$ToDoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
