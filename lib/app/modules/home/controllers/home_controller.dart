import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var tabIndex = 0;

  void ChangeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  HomeListIcon({IconData? objicon, String? iconcaption, String? jumlahx}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              objicon,
              size: 40,
            ),
            Text(
              "${jumlahx} ${iconcaption}",
              style: TextStyle(fontSize: 24),
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
