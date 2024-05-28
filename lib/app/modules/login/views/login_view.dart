// import 'package:flutter/gestures.dart';
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/routes/app_pages.dart';

import '../../../widget/utility/guide.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    bool rememberUser = false;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Werno.utama,
        ),
        child: Scaffold(
          backgroundColor: Werno.utama,
          body: Stack(
            children: [
              Positioned(top: 20, child: buildTop(mediaSize)),
              Positioned(
                  bottom: 0,
                  child: buildBottom(mediaSize, rememberUser, context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTop(Size mediaSize) {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage("assets/icon/icon_simak.png"),
          ),
          Text(
            "SIMAK",
            style: TextStyle(
              color: Werno.putih,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottom(Size mediaSize, bool rememberUser, BuildContext context) {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: buildForm(rememberUser, context),
        ),
      ),
    );
  }

  Widget buildForm(bool rememberUser, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Halo!",
          style: TextStyle(
            color: Werno.utama,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Mohon login terlebih dahulu!",
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 60),
        Text(
          "Username",
          style: const TextStyle(color: Colors.grey),
        ),
        buildInputField(controller.txtUsername),
        const SizedBox(height: 40),
        Text(
          "Password",
          style: const TextStyle(color: Colors.grey),
        ),
        buildInputField(controller.txtPassword, isPassword: true),
        const SizedBox(height: 20),
        buildRememberForgot(rememberUser),
        const SizedBox(height: 20),
        buildLoginButton(),
      ],
    );
  }

  Widget buildInputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget buildRememberForgot(bool rememberUser) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              activeColor: Werno.utama,
              onChanged: (value) {
                rememberUser = value!;
              },
            ),
            Text("Ingat Saya", style: const TextStyle(color: Colors.grey)),
          ],
        ),
        TextButton(
          onPressed: () {},
          child:
              Text("Lupa Sandi?", style: const TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return ElevatedButton(
      onPressed: () => controller.auth(),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Werno.utama,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN"),
    );
  }
}
