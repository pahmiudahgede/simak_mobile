import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/modules/operasi/controllers/operasi_controller.dart';

import 'package:simak/app/modules/operasi/views/operation_important_view.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

class OperasiView extends GetView<OperasiController> {
  const OperasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        accent: Color.fromRGBO(255, 130, 234, 1),
        backButton: false,
        locale: 'id',
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      body: paymentview(),
    );
  }
}
