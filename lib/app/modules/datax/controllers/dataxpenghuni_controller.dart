// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simak/app/routes/app_pages.dart';
import '../../../data/penghuni_service.dart';
import '../../../models/penghuni.dart';

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
  var penghuniList = <Penghuni>[].obs;
  var isLoading = true.obs;
  var urutTurun = false.obs;
  var urutNaik = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPenghunis();
  }

  void fetchPenghunis() async {
    try {
      isLoading(true);
      final response = await PenghuniService().fetchPenghunis();
      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        List<dynamic> jsonResponse = response.body;
        List<Penghuni> penghunis = jsonResponse
            .map((penghuni) => Penghuni.fromJson(penghuni))
            .toList();
        penghuniList.value = penghunis;
        sortPenghunis();
      }
    } catch (e) {
      print('Error fetching penghunis: $e');
    } finally {
      isLoading(false);
    }
  }

  final PenghuniService _penghuniService = PenghuniService();

  Future<void> deletePenghuni(int penghuniId) async {
    try {
      final bool success = await _penghuniService.deletePenghuni(penghuniId);
      if (success) {
        Get.snackbar('Success', 'Penghuni deleted successfully');
        // Refresh data or update UI as needed
      } else {
        Get.snackbar('Error', 'Failed to delete penghuni');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete penghuni: $e');
    }
  }

  void urutNaikClicked() {
    urutTurun.value = false;
    urutNaik.value = true;
    sortPenghunis();
  }

  void urutTurunClicked() {
    urutTurun.value = true;
    urutNaik.value = false;
    sortPenghunis();
  }

  void sortPenghunis() {
    if (urutNaik.value) {
      penghuniList.sort((a, b) => a.nama.compareTo(b.nama));
    } else {
      penghuniList.sort((a, b) => b.nama.compareTo(a.nama));
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

  void showDetailDialog(BuildContext context, Penghuni penghuni) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(penghuni.nama),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: ${penghuni.nama}'),
              Text('No Telp: ${penghuni.noTelp}'),
              Text('Jenis Kelamin: ${penghuni.jenisKelamin}'),
              Text('Status: ${penghuni.status}'),
              Text('Tanggal Masuk: ${penghuni.tanggalMasuk}'),
              Text('Tanggal Keluar: ${penghuni.tanggalKeluar}'),
              Text('Ruang: ${penghuni.namaRuang ?? 'Belum Ditempati'}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Hapus"),
              onPressed: () async {
                bool success =
                    await _penghuniService.deletePenghuni(penghuni.id);

                if (success) {
                  print('Displaying success snackbar');
                  Get.snackbar('Success', 'Penghuni deleted successfully');
                  penghuniList.remove(penghuni);
                  fetchPenghunis();
                } else {
                  print('Displaying error snackbar');
                  Get.snackbar('Error', 'Failed to delete penghuni');
                }

                // Close the dialog
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
