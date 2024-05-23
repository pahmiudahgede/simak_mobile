// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/utility/guide.dart';

class PenghuniDes {
  final IconData foto;
  final String idpenghuni;
  final String nama;
  final String deskripsi;
  final int urut;
  final String nomorHp;
  final String kamar;

  PenghuniDes({
    required this.foto,
    required this.idpenghuni,
    required this.nama,
    required this.deskripsi,
    required this.urut,
    required this.nomorHp,
    required this.kamar,
  });
}

class DataxpenghuniController extends GetxController {
  var urutTurun = false.obs;
  var urutNaik = true.obs;
  var filteredOld = <PenghuniDes>[].obs;

  List<String> namaList = [
    "Fahmi Kurniawan",
    "Ade Putra",
    "Budi Santoso",
    "Citra Dewi",
    "Dewi Ayu",
    "Eka Saputra",
    "Fajar Nugraha",
    "Gita Pratiwi",
    "Hadi Susanto",
    "Intan Permata",
    "Joko Widodo",
    "Kartika Sari",
    "Lina Marlina",
    "Maya Sari",
    "Nur Aisyah",
    "Oka Saputra",
    "Putri Melati",
    "Rizki Fauzan",
    "Siti Nurhaliza",
    "Teguh Prasetyo"
  ];

  late List<PenghuniDes> penghuniOld;

  @override
  void onInit() {
    super.onInit();
    penghuniOld = List<PenghuniDes>.generate(20, (index) {
      return PenghuniDes(
        foto: Icons.image,
        idpenghuni: (index + 1).toString().padLeft(3, '0'),
        nama: namaList[index],
        deskripsi: "lorep ipsum bla bla bla...",
        urut: index + 1,
        nomorHp: "08123456789",
        kamar: "A${(index + 1).toString().padLeft(4, '0')}",
      );
    });
    filterOld();
  }

  void urutNaikClicked() {
    urutTurun.value = false;
    urutNaik.value = true;
    filterOld();
  }

  void urutTurunClicked() {
    urutTurun.value = true;
    urutNaik.value = false;
    filterOld();
  }

  void filterOld() {
    if (urutNaik.value) {
      filteredOld.value = penghuniOld.toList()
        ..sort((a, b) => a.urut.compareTo(b.urut));
    } else {
      filteredOld.value = penghuniOld.toList()
        ..sort((a, b) => b.urut.compareTo(a.urut));
    }
  }

  Widget gesturTekan({
    required RxBool isSelected,
    required Function onTap,
    required String textfilter,
  }) {
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

  void showDetailDialog(BuildContext context, PenghuniDes penghuni) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(penghuni.idpenghuni),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: ${penghuni.nama}'),
              Text('Deskripsi: ${penghuni.deskripsi}'),
              Text('Nomor HP: ${penghuni.nomorHp}'),
              Text('Kamar: ${penghuni.kamar}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("edit"),
              onPressed: () {
                print("edit");
                Get.back();
              },
            ),
            TextButton(
              child: Text("hapus"),
              onPressed: () {
                print("hapus");
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  // @override
  // void onInit() {
  //   filterOld();
  //   super.onInit();
  // }

  @override
  void onReady() {
    urutNaikClicked();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
