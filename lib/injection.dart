
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data/models/to_do_item.dart';
import 'package:to_do_list/data/models/user.dart';
import 'package:to_do_list/data/repositories/auth_repository.dart';
import 'package:to_do_list/data/repositories/to_do_repository.dart';
import 'package:to_do_list/data/services/local/local_item_save_service.dart';
import 'package:to_do_list/data/services/local/local_user_service.dart';
import 'package:to_do_list/viewmodels/auth_vm.dart';
import 'package:to_do_list/viewmodels/to_do_vm.dart';

Future initInjection() async {
  await _initOpenBox();
  _injectLocalService();
  _injectRepository();
  _injectViewModels();
}

void _injectLocalService() {
  Get.put<LocalToDoService>(LocalToDoServiceImpl());
 Get.put<LocalUserService>(LocalUserServiceImpl());
}


Future _initOpenBox() async {
  return Future.wait([
    Hive.openBox<ToDoItem>("to_do_item_list"),
   Hive.openBox<User>("user"),
    
  ]);
}

void _injectViewModels() {
   Get.put(AuthViewModel());
  Get.put(ToDoViewModel());
 
}

void _injectRepository() {
  Get.put<ToDoRepository>(ToDoRepositoryImpl());
   Get.put<AuthRepository>(AuthRepositoryImpl());
}
