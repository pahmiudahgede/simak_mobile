import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottombarController extends GetxController {
  var tabIndex = 0;

  void ChangeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  BotBar({IconData? ikon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(ikon),
      label: label,
    );
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
