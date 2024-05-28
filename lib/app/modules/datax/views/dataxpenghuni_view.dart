import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simak/app/modules/datax/controllers/dataxpenghuni_controller.dart';
import '../../../routes/app_pages.dart';

class DataxpenghuniView extends GetView<DataxpenghuniController> {
  const DataxpenghuniView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penghuni'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.only(bottom: 100),
                    itemCount: controller.penghuniList.length,
                    itemBuilder: (context, index) {
                      final penghuni = controller.penghuniList[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                              'http://192.168.1.3:8000/storage/penghuni/img/' +
                                  penghuni.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(penghuni.nama),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(penghuni.noTelp),
                              Text(penghuni.jenisKelamin),
                              Text(penghuni.namaRuang ?? ''),
                            ],
                          ),
                          onTap: () {
                            controller.showDetailDialog(context, penghuni);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.urutNaikClicked();
            },
            child: Icon(Icons.arrow_upward),
            tooltip: 'Urut Atas',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              controller.urutTurunClicked();
            },
            child: Icon(Icons.arrow_downward),
            tooltip: 'Urut Bawah',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.DATAXPOSHPENGHUNI);
            },
            child: Icon(Icons.add),
            tooltip: 'Add Penghuni',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
