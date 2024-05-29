// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/widget/booting.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "Simak",
    //   initialRoute: Routes.BOTTOMBAR,
    //   getPages: AppPages.routes,
    // );
    return FutureBuilder(
      future: Future.delayed(
        Duration(seconds: 3),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return BootScreen();
        } else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Simak",
            initialRoute: (SpUtil.getBool('isLogin', defValue: false)!
                ? Routes.BOTTOMBAR
                : Routes.LOGIN),
            getPages: AppPages.routes,
          );
        }
      },
    );
  }
}
