import 'package:get/get.dart';
import 'package:to_do_list/viewmodels/auth_vm.dart';
import 'package:to_do_list/views/screens/login/ui/login_page.dart';
import 'package:to_do_list/views/screens/main/ui/home_page.dart';

class SplashController extends GetxController {
  final AuthViewModel authVM = Get.find();
  @override
  void onInit() {
    super.onInit();
    checkIsLogin();
  }

  void checkIsLogin() async {
    var currentUser = await authVM.getCurrentUser();
    if (currentUser == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAndToNamed(LoginPage.route);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAndToNamed(HomePage.route);
      });
    }

  }
}
