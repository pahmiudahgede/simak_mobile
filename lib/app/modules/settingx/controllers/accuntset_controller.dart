import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          labelText: "Password Lama", icon: Icons.security),
                      SizedBox(height: 10),
                      _buildPasswordField(
                          labelText: "Password Baru", icon: Icons.security),
                      SizedBox(height: 10),
                      _buildPasswordField(
                          labelText: "Konfirmasi Password Baru",
                          icon: Icons.security),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk mengubah password di sini
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

  Widget _buildPasswordField({String? labelText, IconData? icon}) {
    return TextField(
      obscureText: true,
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
