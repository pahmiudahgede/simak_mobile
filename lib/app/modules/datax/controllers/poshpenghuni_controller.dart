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
import 'package:image_picker/image_picker.dart';

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
  var imageFile = Rx<File?>(null);
  var imageName = ''.obs;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      imageFile.value = file;
      imageName.value = pickedFile.name;
      print('Image path: ${file.path}');
      Get.snackbar('Success', 'Image selected successfully');
    } else {
      // If the user cancels image selection
      Get.snackbar('Info', 'Image selection canceled');
    }
  }

  Future<void> uploadImageAndCreatePenghuni() async {
    if (imageFile.value == null) {
      Get.snackbar('Error', 'Please select an image first');
      return;
    }

    try {
      final imageBytes = await imageFile.value!.readAsBytes();
      final imageName = this.imageName.value;

      final penghuni = Penghuni(
        id: 0, // Assuming 0 for new entries
        nama: textController1.text,
        noTelp: textController2.text,
        jenisKelamin: textController3.text,
        status: textController4.text,
        tanggalMasuk: textController5.text,
        tanggalKeluar: textController6.text,
        foto: imageName,
        idRuang: selectedRoomId.value!,
      );

      // Send the request to create the Penghuni
      final response = await PenghuniService()
          .createPenghuni(penghuni, imageBytes, imageName);
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
