import 'package:get/get.dart';
import 'package:to_do_list/views/screens/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
