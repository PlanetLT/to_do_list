import 'package:get/get.dart';
import 'package:to_do_list/data/models/user.dart';
import 'package:to_do_list/data/services/local/local_user_service.dart';

abstract class AuthRepository {
  Future<bool> saveUser(User user);
  
  
  Future<User?> getCurrentUser();

}

class AuthRepositoryImpl implements AuthRepository {
  static final AuthRepositoryImpl _singleton =
      AuthRepositoryImpl._internal();
  AuthRepositoryImpl._internal();
  factory AuthRepositoryImpl() => _singleton;

  final LocalUserService local = Get.find<LocalUserService>();
  
  @override
  Future<bool> saveUser(User user) async{
    await local.saveUser(user);
    return true;
  }
  
  @override
  Future<User?> getCurrentUser() {
    return local.getCurrentUser();
  }

}
