import 'package:get/get.dart';

class BottombarController extends GetxController {
  //TODO: Implement BottombarController
  var tabIndex = 0;

  void ChangeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
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
