import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/modules/datax/controllers/dataxkamar_controller.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/utility/guide.dart';

class DataxkamarView extends GetView<DataxkamarController> {
  const DataxkamarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kamar'),
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
                        isSelected: controller.allButtonSelected,
                        onTap: () => controller.allButtonClicked(),
                        textfilter: "semua",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.gesturTekan(
                        isSelected: controller.tersediaButtonSelected,
                        onTap: () => controller.tersediaButtonClicked(),
                        textfilter: "tersedia",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.gesturTekan(
                        isSelected: controller.terpakaiButtonSelected,
                        onTap: () => controller.terpakaiButtonClicked(),
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
                          child: Obx(() {
                            return ListView.builder(
                              padding: EdgeInsets.only(bottom: 100),
                              itemCount: controller.filteredRoom.length,
                              itemBuilder: (context, index) {
                                final statusroom =
                                    controller.filteredRoom[index];
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
                                          child: Text(
                                            statusroom.idruang[0],
                                          ),
                                        ),
                                        title: Text(
                                          statusroom.idruang,
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Rp${statusroom.harga.toString()}',
                                            ),
                                            Text(
                                              statusroom.deskripsi,
                                            ),
                                          ],
                                        ),
                                        trailing: Wrap(
                                          spacing: 12,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: statusroom.isUsed
                                                      ? Werno.hijau
                                                      : Werno.merah,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  statusroom.isUsed
                                                      ? 'tersedia'
                                                      : 'terpakai',
                                                ),
                                                // height: 70,
                                              ),
                                            ),
                                            // Icon(Icons.arrow_right_rounded),
                                          ],
                                        ),
                                        onTap: () {
                                          controller.showDetailDialog(
                                              context, statusroom);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
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
      floatingActionButton: TombolTambah(() {
        Get.toNamed(Routes.DATAXPOSHKAMAR);
      }),
    );
  }
}
