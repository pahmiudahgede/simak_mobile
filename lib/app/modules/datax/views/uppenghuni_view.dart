// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/modules/datax/controllers/uppenghuni_controller.dart';
import 'package:simak/app/routes/app_pages.dart';

import '../../../widget/utility/guide.dart';

class UppenghuniView extends GetView<UppenghuniController> {
  const UppenghuniView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Penghuni'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            controller.FormTextField(
              labelText: 'Name',
              controller: controller.textController1,
              ikon: Icons.person,
              tipeinput: TextInputType.text,
            ),
            const SizedBox(height: 20),
            controller.FormTextField(
              labelText: 'Phone',
              controller: controller.textController2,
              ikon: Icons.phone,
              tipeinput: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: controller.textController4.text.isNotEmpty
                  ? controller.textController4.text
                  : null,
              items: ['Pekerja', 'Pelajar', 'n/a']
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              onChanged: (value) {
                controller.textController4.text = value!;
              },
              decoration: InputDecoration(
                labelText: 'Status',
                prefixIcon: const Icon(Icons.work),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: controller.textController3.text.isNotEmpty
                  ? controller.textController3.text
                  : null,
              items: ['Laki-laki', 'Perempuan']
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              onChanged: (value) {
                controller.textController3.text = value!;
              },
              decoration: InputDecoration(
                labelText: 'Jenis Kelamin',
                prefixIcon: const Icon(Icons.wc),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => DropdownButtonFormField<int>(
                value: controller.selectedRoomId.value,
                items: controller.availableRooms.map((room) {
                  return DropdownMenuItem<int>(
                    value: room.id,
                    child: Text(room.namaRuang),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedRoomId.value = value;
                },
                decoration: InputDecoration(
                  labelText: 'Ruang',
                  prefixIcon: const Icon(Icons.meeting_room_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            controller.FormTextField(
              labelText: 'Tanggal Masuk',
              controller: controller.textController5,
              ikon: Icons.calendar_today,
              tipeinput: TextInputType.datetime,
              onTap: () =>
                  controller.selectDate(context, controller.textController5),
            ),
            const SizedBox(height: 20),
            controller.FormTextField(
              labelText: 'Tanggal Keluar',
              controller: controller.textController6,
              ikon: Icons.calendar_today,
              tipeinput: TextInputType.datetime,
              onTap: () =>
                  controller.selectDate(context, controller.textController6),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.uploadImageAndCreatePenghuni();
                Get.back();
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
