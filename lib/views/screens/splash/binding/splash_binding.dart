import 'package:get/get.dart';
import 'package:to_do_list/views/screens/splash/ui/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
