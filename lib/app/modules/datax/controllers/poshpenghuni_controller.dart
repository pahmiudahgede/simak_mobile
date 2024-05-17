import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PoshpenghuniController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var textController5 = TextEditingController();

  FormTextField(
      {String? labelText,
      TextEditingController? controller,
      IconData? ikon,
      Widget? ikonend,
      TextInputType? tipeinput}) {
    return TextFormField(
      // controller: controller,
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
    );
  }

  Rx<File> image = File('').obs;

  Future<void> pickImage() async {
    try {
      final imagePick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick == null) {
        Get.snackbar('Info', 'Pemilihan gambar dibatalkan.');
        return;
      }
      final imageTemp = File(imagePick.path);
      image.value = imageTemp;
      Get.snackbar('Sukses', 'Gambar berhasil dipilih.');
    } on PlatformException catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.message}',
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
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
  }
}
