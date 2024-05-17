import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/modules/datax/controllers/poshpenghuni_controller.dart';
import 'package:simak/app/routes/app_pages.dart';

class PoshpenghuniView extends GetView<PoshpenghuniController> {
  const PoshpenghuniView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Penghuni'),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Container(
          // padding: EdgeInsets.only(bottom: 50),
          // decoration: BoxDecoration(color: Colors.amber),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    controller.FormTextField(
                      labelText: 'Name',
                      controller: controller.textController1,
                      ikon: Icons.person,
                      tipeinput: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    controller.FormTextField(
                      labelText: 'Phone',
                      controller: controller.textController3,
                      ikon: Icons.phone,
                      tipeinput: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    controller.FormTextField(
                      labelText: 'Address',
                      controller: controller.textController4,
                      ikon: Icons.location_on,
                      tipeinput: TextInputType.streetAddress,
                    ),
                    SizedBox(height: 20),
                    controller.FormTextField(
                      labelText: 'Kamar',
                      controller: controller.textController2,
                      ikon: Icons.meeting_room_rounded,
                      tipeinput: TextInputType.text,
                      ikonend: IconButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          print("pilih kamar");
                        },
                        icon: Icon(
                          Icons.keyboard_capslock_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    controller.FormTextField(
                      labelText: 'Deskripsi',
                      controller: controller.textController5,
                      ikon: Icons.description,
                      tipeinput: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Container(
                        height: Get.height * 0.3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: controller.image.value.path == ''
                            ? Icon(Icons.person)
                            : Image.file(controller.image.value),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => controller.pickImage(),
                      child: Icon(Icons.upload_file),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.offNamed(Routes.DATAXPENGHUHNI),
        backgroundColor: Color.fromARGB(255, 38, 193, 35),
        label: Text(
          "Simpan",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}
