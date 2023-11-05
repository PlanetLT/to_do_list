import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: 2)
  const factory User(
    @HiveField(0) String name,
    @HiveField(1) bool isLogin,
    
  ) = _User;
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
