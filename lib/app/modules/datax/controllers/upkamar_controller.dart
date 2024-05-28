import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/ruang_service.dart';
import '../../../models/ruang.dart';
import 'package:simak/app/modules/datax/controllers/dataxkamar_controller.dart';

class UpkamarController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  // var textController5 = TextEditingController();

  late Room room;

  @override
  void onInit() {
    super.onInit();
    room = Get.arguments as Room;
    textController1.text = room.namaRuang;
    textController2.text = room.kapasitas.toString();
    textController3.text = room.hargaBulan.toString();
    textController4.text = room.luas.toString();
  }

  final DataxkamarController dataxkamarController =
      Get.find<DataxkamarController>();

  void fetchRuangFromDataxkamar() {
    print('Fetch controller 1 triggered');
    dataxkamarController.fetchRuangs();
  }

  void deleteListFromDataxKamar(room) {
    dataxkamarController.ruangList.remove(room);
  }

  Future<void> EditRuang() async {
    try {
      // Construct the Room object with updated values
      final ruang = Room(
        id: room.id,
        namaRuang: textController1.text,
        kapasitas: int.parse(textController2.text),
        hargaBulan: double.parse(textController3.text),
        luas: int.parse(textController4.text),
      );

      final response = await RuangService().editRuang(ruang, room.id);

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Ruang edited successfully');
      } else {
        Get.snackbar('Error', 'Failed to edit ruang: ${response.statusText}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to edit ruang: $e');
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
