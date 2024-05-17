import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:simak/app/modules/datax/controllers/dataxpenghuni_controller.dart';
import 'package:faker/faker.dart';

class DataxpenghuniView extends GetView<DataxpenghuniController> {
  const DataxpenghuniView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Penghuni',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, right: 20, left: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Obx(() => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: controller.leftButtonSelected.value
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  "filter",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              height: 30,
                              width: 100,
                            )),
                        onTap: () => controller.leftButtonClicked(),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        child: Obx(() => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: controller.rightButtonSelected.value
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  "another",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              height: 30,
                              width: 100,
                            )),
                        onTap: () => controller.rightButtonClicked(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 100),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              // children: [
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://picsum.photos/id/$index/200/300"),
                                      ),
                                      title: Text(
                                        faker.person.name(),
                                      ),
                                      subtitle: Text(
                                        faker.lorem.sentence(),
                                      ),
                                      trailing: Wrap(
                                        children: [
                                          Icon(Icons.arrow_right_rounded),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.DATAXPOSHPENGHUNI),
        child: const Icon(Icons.add),
      ),
    );
  }
}
