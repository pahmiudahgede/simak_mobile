import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataxkamarController extends GetxController {
  var leftButtonSelected = false.obs;
  var centerButtonSelected = false.obs;
  var rightButtonSelected = false.obs;

  void leftButtonClicked() {
    rightButtonSelected.value = false;
    centerButtonSelected.value = false;
    leftButtonSelected.value = true;
    // Get.toNamed(Routes.BOTTOMBAR);
  }

  void centertButtonClicked() {
    rightButtonSelected.value = false;
    centerButtonSelected.value = true;
    leftButtonSelected.value = false;
    // Lakukan sesuatu ketika tombol sebelah kanan diklik
  }

  void rightButtonClicked() {
    rightButtonSelected.value = true;
    centerButtonSelected.value = false;
    leftButtonSelected.value = false;
    // Lakukan sesuatu ketika tombol sebelah kanan diklik
  }

  gesturTekan(
      {required RxBool isSelected,
      required VoidCallback onTap,
      required String textfilter}) {
    return GestureDetector(
      child: Obx(() => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isSelected.value ? Colors.blue : Colors.grey,
            ),
            child: Center(
              child: Text(
                textfilter,
                style: TextStyle(color: Colors.white),
              ),
            ),
            height: 30,
            width: 100,
          )),
      onTap: onTap,
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    leftButtonSelected.value = true;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
