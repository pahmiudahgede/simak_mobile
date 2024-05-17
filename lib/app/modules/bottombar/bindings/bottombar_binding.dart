import 'package:get/get.dart';
import '../../datax/controllers/datax_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../login/controllers/login_controller.dart';
import '../../operasi/controllers/operasi_controller.dart';
import '../../payment/controllers/payment_controller.dart';
import '../../settingx/controllers/settingx_controller.dart';

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
    Get.lazyPut<DataxController>(
      () => DataxController(),
    );
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
    Get.lazyPut<OperasiController>(
      () => OperasiController(),
    );
    Get.lazyPut<SettingxController>(
      () => SettingxController(),
    );
  }
}
