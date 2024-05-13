import 'package:get/get.dart';

import '../controllers/settingx_controller.dart';

class SettingxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingxController>(
      () => SettingxController(),
    );
  }
}
