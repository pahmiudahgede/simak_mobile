import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/utility/guide.dart';

class StatusRuang {
  final String idruang;
  final int harga;
  final String deskripsi;
  final bool isUsed;

  StatusRuang({
    required this.idruang,
    required this.harga,
    required this.deskripsi,
    required this.isUsed,
  });
}

class DataxkamarController extends GetxController {
  var terpakaiButtonSelected = false.obs;
  var tersediaButtonSelected = false.obs;
  var allButtonSelected = true.obs;
  var filteredRoom = <StatusRuang>[].obs;

  var statuskamar = <StatusRuang>[
    StatusRuang(
      idruang: "A101",
      harga: 350000,
      deskripsi: "deskripsi 01",
      isUsed: true,
    ),
    StatusRuang(
      idruang: "B202",
      harga: 350000,
      deskripsi: "deskripsi 02",
      isUsed: true,
    ),
    StatusRuang(
      idruang: "C303",
      harga: 350000,
      deskripsi: "deskripsi 03",
      isUsed: false,
    ),
    StatusRuang(
      idruang: "D404",
      harga: 350000,
      deskripsi: "deskripsi 04",
      isUsed: true,
    ),
    StatusRuang(
      idruang: "E505",
      harga: 350000,
      deskripsi: "deskripsi 05",
      isUsed: false,
    ),
    StatusRuang(
      idruang: "F606",
      harga: 350000,
      deskripsi: "deskripsi 06",
      isUsed: true,
    ),
    StatusRuang(
      idruang: "G707",
      harga: 350000,
      deskripsi: "deskripsi 07",
      isUsed: true,
    ),
    StatusRuang(
      idruang: "H808",
      harga: 350000,
      deskripsi: "deskripsi 08",
      isUsed: false,
    ),
  ];

  void allButtonClicked() {
    terpakaiButtonSelected.value = false;
    tersediaButtonSelected.value = false;
    allButtonSelected.value = true;
    filterRoom();
  }

  void tersediaButtonClicked() {
    terpakaiButtonSelected.value = false;
    tersediaButtonSelected.value = true;
    allButtonSelected.value = false;
    filterRoom();
  }

  void terpakaiButtonClicked() {
    terpakaiButtonSelected.value = true;
    tersediaButtonSelected.value = false;
    allButtonSelected.value = false;
    filterRoom();
  }

  void filterRoom() {
    if (tersediaButtonSelected.value) {
      filteredRoom.value =
          statuskamar.where((status) => status.isUsed).toList();
    } else if (terpakaiButtonSelected.value) {
      filteredRoom.value =
          statuskamar.where((status) => !status.isUsed).toList();
    } else {
      filteredRoom.value = statuskamar;
    }
  }

  gesturTekan(
      {required RxBool isSelected,
      required Function onTap,
      required String textfilter}) {
    return Obx(() {
      return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: isSelected.value ? Werno.utama : Werno.abujanda,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            textfilter,
            style: TextStyle(color: Werno.putih),
          ),
        ),
      );
    });
  }

  void showDetailDialog(BuildContext context, StatusRuang status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(status.idruang),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Harga: Rp${status.harga}'),
              Text('Deskripsi: ${status.deskripsi}'),
              Text(
                'Status: ${status.isUsed ? "tersedia" : "terpakai"}',
                style: TextStyle(
                  color: status.isUsed ? Werno.hijau : Werno.merah,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("edit"),
              onPressed: () {
                print("edit");
                // Navigator.of(context).pop();
                // Get.back();
              },
            ),
            TextButton(
              child: Text("hapus"),
              onPressed: () {
                print("hapus");
                // Navigator.of(context).pop();
                // Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void onInit() {
    filterRoom();
    super.onInit();
  }

  @override
  void onReady() {
    allButtonClicked();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
