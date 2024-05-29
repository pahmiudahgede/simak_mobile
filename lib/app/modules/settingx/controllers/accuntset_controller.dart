import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../data/login_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/utility/guide.dart';

class AccuntsetController extends GetxController {
  Widget buildPasswordContainer({BuildContext? context}) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Theme(
            data: Theme.of(context!).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Row(
                children: [
                  Icon(
                    Icons.key,
                    size: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _buildPasswordField(
                          labelText: "Password Lama", icon: Icons.security, controller: oldPasswordController),
                      SizedBox(height: 10),
                      _buildPasswordField(
                          labelText: "Password Baru", icon: Icons.security, controller: newPasswordController),
                      SizedBox(height: 10),
                      _buildPasswordField(
                          labelText: "Konfirmasi Password Baru",
                          icon: Icons.security, controller: confirmPasswordController),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika uonPressed: controller.changePassword,ntuk mengubah password di sini
                          changePassword();
                        },
                        child: Text("Ubah Password"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(
      {String? labelText, IconData? icon, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildDeleteAccountContainer() {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 400),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.delete_forever_rounded,
            size: 25,
            color: Werno.merah,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Hapus Akun",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget buildAppVersionText() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        "Versi Aplikasi 1.0.0",
        style: TextStyle(fontSize: 16, color: Werno.abujanda),
      ),
    );
  }

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void changePassword() async {
    String oldPassword = oldPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;
    String? token = SpUtil.getString('token');

    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar(
        "Error",
        "Harap isi semua field",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.amber,
      );
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar(
        "Error",
        "Konfirmasi password tidak cocok",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.amber,
      );
      return;
    }

    var data = {
      'old_password': oldPassword,
      'password': newPassword,
      'confirm_password': confirmPassword,
    };

    if (token != null) {
      LoginProvider().changePassword(token, data).then((response) {
        if (response.statusCode == 200) {
          Get.snackbar(
            "Sukses",
            response.body['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
          );
          Get.offAllNamed(Routes.BOTTOMBAR); // Ganti dengan route yang sesuai
        } else {
          print('Error: ${response.statusCode}');
          print('Response: ${response.bodyString}');
          Get.snackbar(
            "Gagal",
            response.body['message'] ?? "Gagal mengganti password",
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
    } else {
      Get.snackbar(
        "Error",
        "Token tidak ditemukan",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
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
  }
}
