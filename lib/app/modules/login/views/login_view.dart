// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/routes/app_pages.dart';

import '../../../widget/utility/guide.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginFramework());
  }
}

class LoginFramework extends StatefulWidget {
  const LoginFramework({super.key});

  @override
  State<LoginFramework> createState() => _LoginFrameworkState();
}

class _LoginFrameworkState extends State<LoginFramework> {
  // late Color = Werno.utama;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    // Werno.utama = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Werno.utama,
        //   image: DecorationImage(
        //       image: const AssetImage("assets/images/bg.jpg"),
        //       fit: BoxFit.cover,
        //       colorFilter: ColorFilter.mode(
        //           Werno.utama.withOpacity(0.2), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Werno.utama,
        body: Stack(children: [
          Positioned(top: 20, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(
          //   Icons.location_on_sharp,
          //   size: 60,
          //   color: Werno.putih,
          // ),
          Image(
            image: AssetImage("assets/icon/icon_simak.png"),
          ),
          Text(
            "SIMAK",
            style: TextStyle(
                color: Werno.putih,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
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
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Halo.....",
          style: TextStyle(
            color: Werno.utama,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text("Mohon login terlebhi dahulu!",
            style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 60),
        Text("Email Address", style: const TextStyle(color: Colors.grey)),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        Text("Password", style: const TextStyle(color: Colors.grey)),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _builLoginButton(),
      ],
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                activeColor: Werno.utama,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            Text("Ingat Saya", style: const TextStyle(color: Colors.grey)),
          ],
        ),
        TextButton(
          onPressed: () {},
          child:
              Text("Lupa Sandi?", style: const TextStyle(color: Colors.grey)),
        )
      ],
    );
  }

  Widget _builLoginButton() {
    return ElevatedButton(
      onPressed: ()
          // {
          // debugPrint("Email: ${emailController.text}");
          // debugPrint("Password: ${passwordController.text}");
          // }
          =>
          Get.offAllNamed(Routes.BOTTOMBAR),
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
