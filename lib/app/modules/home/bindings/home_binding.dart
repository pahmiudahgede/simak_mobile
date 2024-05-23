import 'package:get/get.dart';

import 'package:simak/app/modules/home/controllers/notifikasi_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiController>(
      () => NotifikasiController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
