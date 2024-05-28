// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/widget/utility/guide.dart';
import '../../../data/ruang_service.dart';
import '../../../models/ruang.dart';
import '../controllers/upkamar_controller.dart';
import '../controllers/dataxkamar_controller.dart';
import '../../../routes/app_pages.dart';

class UpkamarView extends GetView<UpkamarController> {
  const UpkamarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Ruang'),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          // decoration: BoxDecoration(color: Colors.amber),
          child: ListView(
            children: [
              Column(
                children: [
                  controller.FormTextField(
                    labelText: 'Nama Ruang',
                    controller: controller.textController1,
                    ikon: Icons.numbers,
                    tipeinput: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  controller.FormTextField(
                    labelText: 'Kapasitas',
                    controller: controller.textController2,
                    ikon: Icons.storage_outlined,
                    tipeinput: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  controller.FormTextField(
                    labelText: 'Harga/Bulan',
                    controller: controller.textController3,
                    ikon: Icons.price_change_outlined,
                    tipeinput: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  controller.FormTextField(
                    labelText: 'Luas',
                    controller: controller.textController4,
                    ikon: Icons.description,
                    tipeinput: TextInputType.text,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: TombolSimpan(() {
        controller.EditRuang();
        Get.back();
      }),
    );
  }
}
