import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/utility/guide.dart';
import '../controllers/settingx_controller.dart';

class SettingxView extends GetView<SettingxController> {
  const SettingxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        judul: "Pengaturan",
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 20),
        child: Container(
          // color: Colors.grey[300],
          child: Column(
            children: [
              controller.listKontenSetting(
                pindahke: () {
                  Get.toNamed(Routes.SETTINGXPERSONAL);
                },
                ikonset: Icons.supervised_user_circle,
                capsset: "Informasi Pribadi",
              ),
              controller.listKontenSetting(
                pindahke: () {
                  Get.toNamed(Routes.SETTINGXACCUNSET);
                },
                ikonset: Icons.settings,
                capsset: "Pengaturan Akun",
              ),
              controller.listKontenSetting(
                pindahke: () {
                  SpUtil.clear();
                  Get.offAllNamed(Routes.LOGIN);
                },
                ikonset: Icons.logout_outlined,
                capsset: "Keluar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
