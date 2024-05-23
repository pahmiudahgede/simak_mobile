// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:simak/app/modules/datax/controllers/dataxpenghuni_controller.dart';
// import 'package:faker/faker.dart';

import '../../../widget/utility/guide.dart';

class DataxpenghuniView extends GetView<DataxpenghuniController> {
  const DataxpenghuniView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penghuni'),
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
                        isSelected: controller.urutNaik,
                        onTap: () => controller.urutNaikClicked(),
                        textfilter: "Naik",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.gesturTekan(
                        isSelected: controller.urutTurun,
                        onTap: () => controller.urutTurunClicked(),
                        textfilter: "Turun",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    child: Obx(() {
                      return ListView.builder(
                        padding: EdgeInsets.only(bottom: 100),
                        itemCount: controller.filteredOld.length,
                        itemBuilder: (context, index) {
                          final penghunides = controller.filteredOld[index];
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Icon(penghunides.foto),
                                  ),
                                  title: Text(penghunides.idpenghuni),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(penghunides.nama),
                                      Text(penghunides.deskripsi),
                                      Text('Nomor HP: ${penghunides.nomorHp}'),
                                      Text('Kamar: ${penghunides.kamar}'),
                                    ],
                                  ),
                                  onTap: () {
                                    controller.showDetailDialog(
                                        context, penghunides);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: TombolTambah(() {
        Get.toNamed(Routes.DATAXPOSHPENGHUNI);
      }),
    );
  }
}
