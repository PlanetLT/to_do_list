import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:to_do_list/data/models/user.dart';
import 'package:to_do_list/viewmodels/auth_vm.dart';
import 'package:to_do_list/views/screens/main/ui/home_page.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  final AuthViewModel authVM = Get.find();
  void Login() async {
    var userName = userNameController.text;
    if (userName.isNotEmpty) {
      var condition = await authVM.saveUser(User(userName, true));
      if (condition) {
        FocusManager.instance.primaryFocus!.unfocus();
        Get.offAndToNamed(HomePage.route);
      }
    }
  }
}
