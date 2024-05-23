// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  var filteredPayments = <Payment>[].obs;

  var payments = <Payment>[
    Payment(
      name: "Ikhwan Koto",
      room: "A101",
      date: "2023-05-01",
      isPaid: true,
    ),
    Payment(
      name: "Pake Arrayid",
      room: "B202",
      date: "2023-05-02",
      isPaid: false,
    ),
    Payment(
      name: "Ryan Kimo",
      room: "C303",
      date: "2023-05-03",
      isPaid: true,
    ),
    Payment(
      name: "Arif Mahran",
      room: "D404",
      date: "2023-05-04",
      isPaid: false,
    ),
    Payment(
      name: "Nurrahman Hado",
      room: "E505",
      date: "2023-05-05",
      isPaid: true,
    ),
    Payment(
      name: "Ade Nuri",
      room: "F606",
      date: "2023-05-06",
      isPaid: false,
    ),
    Payment(
      name: "Fitriani Chairi",
      room: "G707",
      date: "2023-05-07",
      isPaid: true,
    ),
    Payment(
      name: "Elsa Aprilio",
      room: "H808",
      date: "2023-05-08",
      isPaid: false,
    ),
    Payment(
      name: "Putri Coti",
      room: "I909",
      date: "2023-05-09",
      isPaid: true,
    ),
    Payment(
      name: "Saputra Enriko",
      room: "J101",
      date: "2023-05-10",
      isPaid: false,
    ),
  ];

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
    if (leftButtonSelected.value) {
      filteredPayments.value =
          payments.where((payment) => payment.isPaid).toList();
    } else if (rightButtonSelected.value) {
      filteredPayments.value =
          payments.where((payment) => !payment.isPaid).toList();
    } else {
      filteredPayments.value = payments; // All payments
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

  void showDetailDialog(BuildContext context, Payment payment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(payment.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ruang: ${payment.room}'),
              Text('Tanggal: ${payment.date}'),
              Text(
                'Status: ${payment.isPaid ? "Lunas" : "Belum Lunas"}',
                style: TextStyle(
                  color: payment.isPaid ? Werno.hijau : Werno.merah,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                // Navigator.of(context).pop();
                Get.back();
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
    filterPayments();
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
