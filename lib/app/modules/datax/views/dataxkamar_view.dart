import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/modules/datax/controllers/dataxkamar_controller.dart';
import 'package:faker/faker.dart';

import '../../../routes/app_pages.dart';

class DataxkamarView extends GetView<DataxkamarController> {
  const DataxkamarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Ruang'),
        backgroundColor: Colors.amber,
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
                      controller.gesturTekan(
                        isSelected: controller.leftButtonSelected,
                        onTap: () => controller.leftButtonClicked(),
                        textfilter: "semua",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.gesturTekan(
                        isSelected: controller.centerButtonSelected,
                        onTap: () => controller.centertButtonClicked(),
                        textfilter: "tersedia",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.gesturTekan(
                        isSelected: controller.rightButtonSelected,
                        onTap: () => controller.rightButtonClicked(),
                        textfilter: "terpakai",
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
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    // padding: EdgeInsets.all(0),
                                    margin: EdgeInsets.only(bottom: 10),
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
                                        spacing: 12,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text('Penuh'),
                                              // height: 70,
                                            ),
                                          ),
                                          Icon(Icons.arrow_right_rounded),
                                        ],
                                      ),
                                    ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.DATAXPOSHKAMAR),
        label: Text(
          "Tambah",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
