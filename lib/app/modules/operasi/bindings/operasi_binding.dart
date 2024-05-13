import 'package:get/get.dart';

import '../controllers/operasi_controller.dart';

class OperasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OperasiController>(
      () => OperasiController(),
    );
  }
}
