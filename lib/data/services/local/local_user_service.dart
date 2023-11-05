import 'package:hive/hive.dart';

import '../../models/user.dart';

abstract class LocalUserService {
  Future saveUser(User user);

  Future<User?> getCurrentUser();
  Future deleteCurrentUser();
}

class LocalUserServiceImpl implements LocalUserService {
  static final LocalUserServiceImpl _singleton =
      LocalUserServiceImpl._internal();
  LocalUserServiceImpl._internal();
  factory LocalUserServiceImpl() => _singleton;

  Future<Box<User>> box = Hive.openBox<User>("user");

  @override
  Future<User?> getCurrentUser() async {
    var b = Hive.box<User>("user");
    var list = b.values.toList();
    if (list.isEmpty) {
      return null;
    } else {
      return list[0];
    }
  }

  @override
  Future saveUser(User user) async {
    var tBox = await box;
    tBox.add(user);
  }

  @override
  Future deleteCurrentUser() async {
    var tBox = await box;
    await tBox.clear();
  }
}
