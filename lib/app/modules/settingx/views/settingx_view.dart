import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settingx_controller.dart';

class SettingxView extends GetView<SettingxController> {
  const SettingxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingxView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'halaman setting',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
