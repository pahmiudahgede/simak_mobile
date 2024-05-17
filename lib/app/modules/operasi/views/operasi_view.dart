import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/operasi_controller.dart';

class OperasiView extends GetView<OperasiController> {
  const OperasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operasional Kos'),
        centerTitle: false,
      ),
      body: const Center(
        child: Text(
          'halaman operasi',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
