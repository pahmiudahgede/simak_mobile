import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoshkamarController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  // var textController5 = TextEditingController();

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
