import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/ruang_service.dart';
import '../../../models/ruang.dart';
import '../../../routes/app_pages.dart';

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
  var ruangList = <Room>[].obs;
  var isLoading = true.obs;
  var terpakaiButtonSelected = false.obs;
  var tersediaButtonSelected = false.obs;
  var allButtonSelected = true.obs;
  var filteredRoomList = <Room>[].obs;

  void fetchRuangs() async {
    try {
      isLoading(true);
      final response = await RuangService().fetchRuangs();
      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        List<dynamic> jsonResponse = response.body;
        List<Room> ruangs =
            jsonResponse.map((ruang) => Room.fromJson(ruang)).toList();
        ruangList.value = ruangs;
        filterRoom(); // Ensure the rooms are filtered initially
      }
    } catch (e) {
      print('Error fetching rooms: $e');
    } finally {
      isLoading(false);
    }
  }

  final RuangService _ruangService = RuangService();

  Future<void> deleteRuang(int ruangId) async {
    try {
      final bool success = await _ruangService.deleteRuang(ruangId);
      if (success) {
        Get.snackbar('Success', 'Ruang deleted successfully');
        // Refresh data or update UI as needed
      } else {
        Get.snackbar('Error', 'Failed to delete penghuni');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete penghuni: $e');
    }
  }

  void filterRoom() {
    if (allButtonSelected.value == true) {
      filteredRoomList.value = ruangList;
    } else if (terpakaiButtonSelected.value == true) {
      filteredRoomList.value = ruangList
          .where((room) => room.statusKapasitas == 'Ditempati')
          .toList();
    } else if (tersediaButtonSelected.value == true) {
      filteredRoomList.value = ruangList
          .where((room) => room.statusKapasitas != 'Ditempati')
          .toList();
    }
  }

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

  void showDetailDialog(BuildContext context, Room room) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(room.namaRuang),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kapasitas: ${room.kapasitas}'),
              Text(
                  'Penghuni: ${room.penghunis?.map((p) => p.nama).join(", ") ?? "No Penghuni"}'),
              Text('Harga: Rp. ${room.hargaBulan}'),
              Text('Luas: ${room.luas}'),
              Text(
                'Status: ${room.statusKapasitas != 'Ditempati' ? "tersedia" : "terpakai"}',
                style: TextStyle(
                  color: room.statusKapasitas != 'Ditempati'
                      ? Werno.hijau
                      : Werno.merah,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Edit"),
              onPressed: () {
                Get.toNamed(
                  Routes.UPKAMAR,
                  arguments: room,
                );
              },
            ),
            TextButton(
              child: Text("Hapus"),
              onPressed: () async {
                bool success = await _ruangService.deleteRuang(room.id);

                if (success) {
                  print('Displaying success snackbar');
                  Get.snackbar('Success', 'Room deleted successfully');
                  ruangList.remove(room);
                  fetchRuangs();
                } else {
                  print('Displaying error snackbar');
                  Get.snackbar('Error', 'Failed to delete room');
                }

                // Close the dialog
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchRuangs();
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
