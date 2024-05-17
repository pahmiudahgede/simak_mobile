import 'package:get/get.dart';
import 'package:simak/app/modules/datax/views/poshkamar_view.dart';
import 'package:simak/app/modules/datax/views/poshpenghuni_view.dart';
import '../modules/datax/views/dataxkamar_view.dart';

import '../modules/bottombar/bindings/bottombar_binding.dart';
import '../modules/bottombar/views/bottombar_view.dart';
import '../modules/datax/bindings/datax_binding.dart';
import '../modules/datax/views/datax_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/operasi/bindings/operasi_binding.dart';
import '../modules/operasi/views/operasi_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/settingx/bindings/settingx_binding.dart';
import '../modules/settingx/views/settingx_view.dart';
import '../modules/datax/views/dataxpenghuni_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => const BottombarView(),
      binding: BottombarBinding(),
    ),
    GetPage(
      name: _Paths.DATAX,
      page: () => const DataxView(),
      binding: DataxBinding(),
    ),
    GetPage(
      name: _Paths.DATAXPENGHUHNI,
      page: () => const DataxpenghuniView(),
      binding: DataxBinding(),
    ),
    GetPage(
      name: _Paths.DATAXPOSHPENGHUNI,
      page: () => const PoshpenghuniView(),
      binding: DataxBinding(),
    ),
    GetPage(
      name: _Paths.DATAXKAMAR,
      page: () => const DataxkamarView(),
      binding: DataxBinding(),
    ),
    GetPage(
      name: _Paths.DATAXPOSHKAMAR,
      page: () => const PoshkamarView(),
      binding: DataxBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.OPERASI,
      page: () => const OperasiView(),
      binding: OperasiBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGX,
      page: () => const SettingxView(),
      binding: SettingxBinding(),
    ),
  ];
}
