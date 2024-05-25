// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/login_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/utility/guide.dart';

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void auth() {
    String username = txtUsername.text;
    String password = txtPassword.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Harap isi field",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.amber,
      );
    } else {
      var data = {
        "username": username,
        "password": password,
      };
      LoginProvider().attempt(data).then((value) {
        if (value.statusCode == 200) {
          // Get.snackbar(
          //   "Berhasil",
          //   "Anda Masuk",
          //   backgroundColor: Colors.green
          // );
          Get.offAllNamed(Routes.BOTTOMBAR);
        } else {
          print('Error: ${value.statusCode}');
          print('Response: ${value.bodyString}');
          Get.snackbar(
            "Gagal",
            "Anda Gagal Masuk: ${value.statusCode}",
            backgroundColor: Colors.red,
          );
        }
      }).catchError((error) {
        print('Error: $error');
        Get.snackbar(
          "Gagal",
          "Terjadi kesalahan",
          backgroundColor: Colors.red,
        );
      });
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
    // txtUsername.dispose();
    super.onClose();
  }
}
