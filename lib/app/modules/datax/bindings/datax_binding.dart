import 'package:get/get.dart';

import 'package:simak/app/modules/datax/controllers/dataxkamar_controller.dart';
import 'package:simak/app/modules/datax/controllers/dataxpenghuni_controller.dart';
import 'package:simak/app/modules/datax/controllers/poshkamar_controller.dart';
import 'package:simak/app/modules/datax/controllers/poshpenghuni_controller.dart';

import '../controllers/datax_controller.dart';

class DataxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoshkamarController>(
      () => PoshkamarController(),
    );
    Get.lazyPut<PoshpenghuniController>(
      () => PoshpenghuniController(),
    );
    Get.lazyPut<DataxkamarController>(
      () => DataxkamarController(),
    );
    Get.lazyPut<DataxpenghuniController>(
      () => DataxpenghuniController(),
    );
    Get.lazyPut<DataxController>(
      () => DataxController(),
    );
  }
}
