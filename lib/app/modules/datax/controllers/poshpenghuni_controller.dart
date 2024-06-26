import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/ruang_service.dart';
import '../../../models/ruang.dart';
import '../../../data/penghuni_service.dart';
import '../../../models/penghuni.dart';

class PoshpenghuniController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var textController5 = TextEditingController();
  var textController6 = TextEditingController();
  var textController7 = TextEditingController();

  Widget FormTextField({
    String? labelText,
    TextEditingController? controller,
    IconData? ikon,
    Widget? ikonend,
    TextInputType? tipeinput,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(ikon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            suffixIcon: ikonend,
          ),
          keyboardType: tipeinput,
        ),
      ),
    );
  }

  Rx<File> image = File('').obs;
  RxList<Room> availableRooms = <Room>[].obs;
  var selectedRoomId = Rxn<int>();

  Future<void> uploadImageAndCreatePenghuni() async {
    try {
      final penghuni = Penghuni(
        id: 0, // Assuming 0 for new entries
        nama: textController1.text,
        noTelp: textController2.text,
        jenisKelamin: textController3.text,
        status: textController4.text,
        tanggalMasuk: textController5.text,
        tanggalKeluar: textController6.text,
        foto: 'default_img.png',
        idRuang: selectedRoomId.value!,
      );

      final jsonData = penghuni.toJson();
      print('JSON Data: ${jsonEncode(jsonData)}'); // Print JSON data

      final response = await PenghuniService().createPenghuni(penghuni);
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Penghuni created successfully');
      } else {
        Get.snackbar(
            'Error', 'Failed to create penghuni: ${response.statusText}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
    }
  }

  Future<void> fetchAvailableRooms() async {
    try {
      final response = await RuangService().fetchAvailableRooms();
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.body;
        availableRooms.assignAll(
          jsonResponse.map((room) => Room.fromJson(room)).toList(),
        );
      } else {
        Get.snackbar('Error', 'Failed to load rooms: ${response.statusText}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load rooms: $e');
    }
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAvailableRooms();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    textController5.dispose();
    textController6.dispose();
    textController7.dispose();
  }
}
