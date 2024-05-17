import 'package:get/get.dart';

import 'package:simak/app/modules/settingx/controllers/accuntset_controller.dart';
import 'package:simak/app/modules/settingx/controllers/personaldata_controller.dart';

import '../controllers/settingx_controller.dart';

class SettingxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccuntsetController>(
      () => AccuntsetController(),
    );
    Get.lazyPut<PersonaldataController>(
      () => PersonaldataController(),
    );
    Get.lazyPut<SettingxController>(
      () => SettingxController(),
    );
  }
}
