import 'dart:async';
import 'package:get/get.dart';
import 'package:to_do_list/data/models/user.dart';
import 'package:to_do_list/data/repositories/auth_repository.dart';

class AuthViewModel {
  static final AuthViewModel _singleton = AuthViewModel._internal();
  factory AuthViewModel() => _singleton;
  AuthViewModel._internal() {}

  final AuthRepository _toDoRepo = Get.find();

  Future<User?> getCurrentUser() {
    return _toDoRepo.getCurrentUser();
  }
  
  Future<bool> saveUser(User user){
    return _toDoRepo.saveUser(user);
  }

}
