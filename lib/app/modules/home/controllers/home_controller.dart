import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0;

  void ChangeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  HomeListIcon(
      {IconData? objicon, String? iconcaption, String? jumlahx, Color? warna}) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        width: 160,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Icon(
                  objicon,
                  size: 40,
                ),
              ),
              SizedBox(height: 8),
              Flexible(
                child: Text(
                  "${jumlahx} ${iconcaption}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
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
