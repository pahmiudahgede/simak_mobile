import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/modules/datax/views/datax_view.dart';
import 'package:simak/app/modules/home/views/home_view.dart';
import 'package:simak/app/modules/operasi/views/operasi_view.dart';
import 'package:simak/app/modules/payment/views/payment_view.dart';
import 'package:simak/app/modules/settingx/views/settingx_view.dart';
// import 'package:simak/app/modules/login/views/login_view.dart';

import '../../../widget/utility/guide.dart';
import '../controllers/bottombar_controller.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottombarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                // LoginView(),
                HomeView(),
                DataxView(),
                PaymentView(),
                OperasiView(),
                SettingxView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Werno.abujanda,
            selectedItemColor: Werno.utama,
            onTap: controller.ChangeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              controller.BotBar(
                ikon: Icons.home,
                label: 'Home',
              ),
              controller.BotBar(
                ikon: Icons.list_alt,
                label: 'Data',
              ),
              controller.BotBar(
                ikon: Icons.wallet,
                label: 'Payment',
              ),
              controller.BotBar(
                ikon: Icons.data_exploration_outlined,
                label: 'Operasi',
              ),
              controller.BotBar(
                ikon: Icons.settings,
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }
}
