import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/ruang_service.dart';
import '../../../models/ruang.dart';
import 'package:simak/app/modules/datax/controllers/dataxkamar_controller.dart';

class PoshkamarController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  // var textController5 = TextEditingController();

  final DataxkamarController dataxkamarController =
      Get.find<DataxkamarController>();

  void fetchRuangFromDataxkamar() {
    print('Fetch controller 1 triggered');
    dataxkamarController.fetchRuangs();
  }

  void deleteListFromDataxKamar(room) {
    dataxkamarController.ruangList.remove(room);
  }

  Future<void> CreateRuang() async {
    try {
      final ruang = Room(
        id: 0,
        namaRuang: textController1.text,
        kapasitas: int.parse(textController2.text),
        hargaBulan: double.parse(textController3.text),
        luas: int.parse(textController4.text),
      );

      final response = await RuangService().createRuang(ruang);
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Ruang created successfully');
      } else {
        Get.snackbar('Error', 'Failed to create ruang: ${response.statusText}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create ruang: $e');
    }
  }

  FormTextField({
    String? labelText,
    TextEditingController? controller,
    IconData? ikon,
    Widget? ikonkamar,
    IconData? tempek,
    TextInputType? tipeinput,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(ikon),
        // suffixIcon: ikonkamar,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      keyboardType: tipeinput,
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    // textController5.dispose();
  }
}
