import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingxController extends GetxController {
  listKontenSetting({
    IconData? ikonset,
    String? capsset,
    VoidCallback? pindahke,
  }) {
    return GestureDetector(
      onTap: pindahke,
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            Icon(
              ikonset,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "${capsset}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
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
