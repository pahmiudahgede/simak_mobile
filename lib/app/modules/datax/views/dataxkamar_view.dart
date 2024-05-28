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
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    children: [
                      controller.gesturTekan(
                        isSelected: controller.allButtonSelected,
                        onTap: () => controller.allButtonClicked(),
                        textfilter: "Semua",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.gesturTekan(
                        isSelected: controller.tersediaButtonSelected,
                        onTap: () => controller.tersediaButtonClicked(),
                        textfilter: "Tersedia",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.gesturTekan(
                        isSelected: controller.terpakaiButtonSelected,
                        onTap: () => controller.terpakaiButtonClicked(),
                        textfilter: "Terpakai",
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
                              itemCount: controller.filteredRoomList.length,
                              itemBuilder: (context, index) {
                                final room = controller.filteredRoomList[index];
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
                                          child: Text(
                                            room.id.toString(),
                                          ),
                                        ),
                                        title: Text(
                                          room.namaRuang,
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Rp. ${room.hargaBulan.toString()}',
                                            ),
                                            Text(
                                              'Penghuni: ${room.penghunis?.map((p) => p.nama).join(", ") ?? "Tidak ada penghuni"}',
                                              style: TextStyle(
                                                  color: Colors.grey[700]),
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
                                                  color: room.statusKapasitas ==
                                                          'Ditempati'
                                                      ? Werno.merah
                                                      : Werno.hijau,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  room.statusKapasitas ==
                                                          'Ditempati'
                                                      ? 'Terpakai'
                                                      : 'Tersedia',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                // height: 70,
                                              ),
                                            ),
                                            // Icon(Icons.arrow_right_rounded),
                                          ],
                                        ),
                                        onTap: () {
                                          controller.showDetailDialog(
                                              context, room);
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
