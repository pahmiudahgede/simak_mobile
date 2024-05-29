import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/pengumuman.dart';
import '../../../data/pengumuman_provider.dart';

class HomeController extends GetxController {
  HomeListIcon(
      {IconData? objicon, String? iconcaption, String? jumlahx, Color? warna}) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        width: 160,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Icon(
                  objicon,
                  size: 40,
                ),
              ),
              SizedBox(height: 8),
              Flexible(
                child: Text(
                  "${jumlahx} ${iconcaption}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // api/pengumumans
  var pengumumans = List<Pengumuman>.empty().obs;
  final PengumumanProvider pengumumanProvider = PengumumanProvider();

  @override
  void onInit() {
    super.onInit();
    fetchPengumumans();
  }

  void add(String title, String message) {
    if (title != '' && message != '') {
      pengumumanProvider.createPengumuman(title, message).then((response) {
        if (!response.status.hasError) {
          fetchPengumumans();
        } else {
          print("Failed to create pengumuman: ${response.statusText}");
        }
      });
    } else {
      print("Masukkan semua dengan benar");
    }
  }

  void fetchPengumumans() async {
    try {
      final response = await pengumumanProvider.getAllPengumumans();
      if (response.status.hasError) {
        print("Failed to fetch data: ${response.statusText}");
        return;
      }

      final Map<String, dynamic> responseData = response.body;
      final List<dynamic> data = responseData['data'];

      pengumumans
          .assignAll(data.map((json) => Pengumuman.fromJson(json)).toList());
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<bool> delete(int id) async {
    bool _deleted = false;
    await Get.defaultDialog(
      title: "DELETE",
      middleText: "Apakah kamu yakin untuk menghapus data user ini?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () {
        pengumumanProvider.deletePengumuman(id).then((value) {
          pengumumans.removeWhere((element) => element.id == id);
          _deleted = true;
        });
        Get.back();
      },
      textCancel: "Tidak",
    );
    return _deleted;
  }

  Future<bool> deleteAll() async {
    bool _deleted = false;
    await Get.defaultDialog(
      title: "DELETE ALL",
      middleText: "Apakah kamu yakin untuk menghapus semua data pengumuman?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        for (var pengumuman in pengumumans) {
          final response = await pengumumanProvider.deletePengumuman(pengumuman.id);
          if (response.status.hasError) {
            print("Failed to delete pengumuman with id ${pengumuman.id}: ${response.statusText}");
          }
        }
        pengumumans.clear();
        _deleted = true;
        Get.back();
      },
      textCancel: "Tidak",
    );
    return _deleted;
  }

  void edit(int id, String title, String message) {
    pengumumanProvider.editPengumuman(id, title, message).then((response) {
      if (!response.status.hasError) {
        fetchPengumumans();
      } else {
        print("Failed to edit pengumuman: ${response.statusText}");
      }
    });
  }

  buatPengumumanForm(BuildContext context) {
    TextEditingController judulController = TextEditingController();
    TextEditingController deskripsiController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: Text('Buat Pengumuman'),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: judulController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: deskripsiController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              final title = judulController.text;
              final message = deskripsiController.text;
              add(title, message);
              Get.back();
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }

  editPengumumanForm(BuildContext context, int index, Pengumuman pengumuman) {
    TextEditingController judulController =
        TextEditingController(text: pengumuman.judul);
    TextEditingController deskripsiController =
        TextEditingController(text: pengumuman.deskripsi);

    return Get.dialog(
      AlertDialog(
        title: Text('Edit Pengumuman'),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: judulController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: deskripsiController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              final title = judulController.text;
              final message = deskripsiController.text;

              edit(pengumuman.id, title, message);
              Get.back();
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
