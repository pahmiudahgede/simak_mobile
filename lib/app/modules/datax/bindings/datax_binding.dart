import 'package:get/get.dart';

import '../controllers/datax_controller.dart';

class DataxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataxController>(
      () => DataxController(),
    );
  }
}
