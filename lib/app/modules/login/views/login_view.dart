// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              height: 150,
              // child: Image.asset(
              //   "assets/logo/logo-login.png",
              //   fit: BoxFit.contain,
              // ),
            ),
            SizedBox(height: 30),
            Text(
              "Masuk dulu coyyy....",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Nomor HP",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.phoneC,
              keyboardType: TextInputType.phone,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Cth. 08129011xxxx",
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    activeColor: Colors.pink,
                    value: controller.checkC.value,
                    onChanged: (value) => controller.checkC.toggle(),
                  ),
                ),
                Expanded(
                  child: Text("Ingat Saya"),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.BOTTOMBAR),
              child: Text(
                "MASUK",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                fixedSize: Size(150, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
