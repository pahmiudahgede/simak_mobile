import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/datax_controller.dart';

class DataxView extends GetView<DataxController> {
  const DataxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kos"),
        backgroundColor: Color.fromARGB(255, 242, 4, 234),
      ),
    );
  }
}
