import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class BootScreen extends StatelessWidget {
  const BootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 16, 196),
        body: Center(
          child: Text('loading ...'),
          // child: Container(
          //   width: Get.width * 0.5,
          //   height: Get.width * 0.5,
          // child: Image.asset("assets/logo/nama_logo.png"),
        ),
      ),
    );
  }
}
