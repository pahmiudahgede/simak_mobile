// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/payment_service.dart';
import '../../../models/pembayaran.dart';

import '../../../widget/utility/guide.dart';

class Payment {
  final String name;
  final String room;
  final String date;
  final bool isPaid;

  Payment({
    required this.name,
    required this.room,
    required this.date,
    required this.isPaid,
  });
}

class PaymentController extends GetxController {
  var leftButtonSelected = false.obs;
  var rightButtonSelected = false.obs;
  var allButtonSelected = true.obs;
  var isLoading = true.obs;
  var pembayaranList = <DetailTagihan>[].obs;
  var filteredPayments = <DetailTagihan>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPembayarans();
  }

  void fetchPembayarans() async {
    try {
      isLoading(true);
      final response = await PaymentService().fetchPembayarans();
      if (response.hasError) {
        Get.snackbar(
            'Error', 'Failed to fetch payments: ${response.statusText}');
      } else {
        List<dynamic> jsonResponse = response.body;
        List<DetailTagihan> payments = jsonResponse
            .map((pembayaran) => DetailTagihan.fromJson(pembayaran))
            .toList();
        pembayaranList.value = payments;
        filterPayments();
      }
    } catch (e) {
      Get.snackbar('Error', 'Error fetching payments: $e');
    } finally {
      isLoading(false);
    }
  }

  void leftButtonClicked() {
    leftButtonSelected.value = true;
    rightButtonSelected.value = false;
    allButtonSelected.value = false;
    filterPayments();
  }

  void rightButtonClicked() {
    leftButtonSelected.value = false;
    rightButtonSelected.value = true;
    allButtonSelected.value = false;
    filterPayments();
  }

  void allButtonClicked() {
    leftButtonSelected.value = false;
    rightButtonSelected.value = false;
    allButtonSelected.value = true;
    filterPayments();
  }

  void filterPayments() {
    if (allButtonSelected.value) {
      filteredPayments.value = List.from(pembayaranList);
    } else if (leftButtonSelected.value) {
      filteredPayments.value = pembayaranList
          .where((pembayaran) => pembayaran.status == 'Lunas')
          .toList();
    } else if (rightButtonSelected.value) {
      filteredPayments.value = pembayaranList
          .where((pembayaran) => pembayaran.status != 'Lunas')
          .toList();
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

  void showDetailDialog(BuildContext context, DetailTagihan payment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: payment.fotoBukti != null
              ? Image.network(
                  'http://192.168.1.3:8000/storage/pembayaran/img/' +
                      payment.fotoBukti!)
              : Text('Tidak ada bukti pembayaran'),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    payment.status == 'Lunas' ? Colors.grey : Colors.green,
              ),
              onPressed: payment.status == 'Lunas'
                  ? null
                  : () async {
                      var response = await PaymentService()
                          .konfirmasiPembayaran(payment.id);
                      if (response.statusCode == 200) {
                        Get.snackbar('Success', 'Data dilunaskan');
                        fetchPembayarans();
                      } else {
                        Get.snackbar('Error',
                            'Data tidak berhasil dilunaskan: ${response.body}');
                      }
                      Navigator.pop(context);
                    },
              child: Icon(Icons.check),
            ),
          ],
        );
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    // leftButtonSelected.value = true;
    allButtonClicked();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
