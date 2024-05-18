import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

class BootScreen extends StatelessWidget {
  const BootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              mainAxisSize: MainAxisSize
                  .min, // Minimize the size of Column to its children
              children: [
                Image.asset("assets/icon/icon_simak.png"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "SIMAK",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
