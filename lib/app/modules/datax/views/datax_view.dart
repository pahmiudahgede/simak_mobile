import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/datax_controller.dart';

class DataxView extends GetView<DataxController> {
  const DataxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kos"),
        backgroundColor: Color.fromARGB(255, 242, 4, 234),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Test",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  controller.KontenData(
                    starticon: Icons.home,
                    datatitle: "judul data",
                    datasubtitle: "subjudul data",
                    buttonicon: Icons.arrow_circle_right_sharp,
                    tekan: () => Get.toNamed(Routes.DATAXPENGHUHNI),
                  ),
                  controller.KontenData(
                    starticon: Icons.home,
                    datatitle: "judul data",
                    datasubtitle: "subjudul data",
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
