import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simak/app/modules/datax/views/datax_view.dart';
import 'package:simak/app/modules/home/views/home_view.dart';
import 'package:simak/app/modules/operasi/views/operasi_view.dart';
import 'package:simak/app/modules/payment/views/payment_view.dart';
import 'package:simak/app/modules/settingx/views/settingx_view.dart';
// import 'package:simak/app/modules/login/views/login_view.dart';

import '../controllers/bottombar_controller.dart';

class BottombarView extends StatelessWidget {
  const BottombarView({Key? key}) : super(key: key);
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
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.amberAccent,
            onTap: controller.ChangeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomNavigationBar(
                ikon: Icons.home,
                label: 'Home',
              ),
              _bottomNavigationBar(
                ikon: Icons.question_mark,
                label: 'Data',
              ),
              _bottomNavigationBar(
                ikon: Icons.question_mark,
                label: 'Payment',
              ),
              _bottomNavigationBar(
                ikon: Icons.question_mark,
                label: 'Operational',
              ),
              _bottomNavigationBar(
                ikon: Icons.question_mark,
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBar({IconData? ikon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(ikon),
      label: label,
    );
  }
}
