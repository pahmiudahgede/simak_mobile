import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/utility/guide.dart';

class DataxController extends GetxController {
  KontenData({
    IconData? starticon,
    String? datatitle,
    String? datasubtitle,
    IconData? buttonicon,
    VoidCallback? tekan,
  }) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Werno.utama,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    starticon,
                    size: 39,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${datatitle}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Werno.hitam,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${datasubtitle}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: tekan,
                    // onPressed: () => Get.offAllNamed(Routes.PAYMENT),
                    icon: Icon(
                      buttonicon,
                      color: Werno.putih,
                      shadows: [
                        Shadow(
                          blurRadius: 55,
                          color: Werno.hitam,
                        ),
                      ],
                      size: 70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
