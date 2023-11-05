import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data/models/to_do_item.dart';
import 'package:to_do_list/data/models/user.dart';

class HiveUtils {
  static Future registerHive() async {
    await Hive.initFlutter();
    _register<ToDoItem>(1, ToDoItemImplAdapter());
    _register<User>(2, UserImplAdapter());
  }
}

void _register<T>(int typeId, TypeAdapter<T> adapter) {
  if (!Hive.isAdapterRegistered(typeId)) {
    Hive.registerAdapter<T>(adapter);
  }
}
