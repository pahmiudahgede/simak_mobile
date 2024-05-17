import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/accuntset_controller.dart';

class AccuntsetView extends GetView<AccuntsetController> {
  const AccuntsetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.only(right: 15, left: 15, top: 30),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccuntsetController()
                        .buildPasswordContainer(context: context),
                    AccuntsetController().buildDeleteAccountContainer(),
                  ],
                ),
              ),
            ),
            AccuntsetController().buildAppVersionText(),
          ],
        ),
      ),
    );
  }
}
