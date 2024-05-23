import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/utility/guide.dart';
import '../controllers/datax_controller.dart';

class DataxView extends GetView<DataxController> {
  const DataxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        judul: "Data Kos",
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 40,
              bottom: 20,
              right: 20,
              left: 20,
            ),
            child: Center(
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Test",
                  //       style: TextStyle(
                  //         fontSize: 24,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Icon(Icons.more_horiz),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  controller.KontenData(
                    starticon: Icons.person_pin_rounded,
                    datatitle: "Data Penghuni",
                    datasubtitle: "List data penghuni kos",
                    buttonicon: Icons.arrow_circle_right_sharp,
                    tekan: () => Get.toNamed(Routes.DATAXPENGHUHNI),
                  ),
                  controller.KontenData(
                    starticon: Icons.bed,
                    datatitle: "Data Kamar",
                    datasubtitle: "List kamar yang ada di kos",
                    buttonicon: Icons.arrow_circle_right_sharp,
                    tekan: () => Get.toNamed(Routes.DATAXKAMAR),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
