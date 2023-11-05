import 'package:get/get.dart';
import 'package:to_do_list/views/screens/main/ui/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
