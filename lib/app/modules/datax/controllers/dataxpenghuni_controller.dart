import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';

class DataxpenghuniController extends GetxController {
  //TODO: Implement DataxpenghuniController

  var leftButtonSelected = false.obs;
  var rightButtonSelected = false.obs;

  void leftButtonClicked() {
    leftButtonSelected.value = true;
    rightButtonSelected.value = false;
    // Get.toNamed(Routes.BOTTOMBAR);
  }

  void rightButtonClicked() {
    leftButtonSelected.value = false;
    rightButtonSelected.value = true;
    // Lakukan sesuatu ketika tombol sebelah kanan diklik
  }

  @override
  void onInit() {
    super.onInit();
    leftButtonSelected.value = true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
