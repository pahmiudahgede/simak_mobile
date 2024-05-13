import 'package:get/get.dart';
import 'package:simak/app/modules/home/controllers/home_controller.dart';
import 'package:simak/app/modules/login/controllers/login_controller.dart';

import '../controllers/bottombar_controller.dart';

class BottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottombarController>(
      () => BottombarController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
