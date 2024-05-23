// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationItem {
  final String title;
  final String subtitle;
  final String date;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.date,
    this.isRead = false,
  });
}

class NotifikasiController extends GetxController {
  var notifications = <NotificationItem>[
    NotificationItem(
      title: "Pembayaran baru nih...",
      subtitle: "Pembayaran Anda telah berhasil diproses.",
      date: "hari ini 14:45",
      isRead: false,
    ),
    NotificationItem(
      title: "Tagihan Baru nih bro...",
      subtitle: "Anda memiliki tagihan baru untuk bulan ini.",
      date: "2023-05-09",
      isRead: true,
    ),
    NotificationItem(
      title: "Pemberitahuan Penting",
      subtitle: "Ada perubahan penting dalam jadwal Anda.",
      date: "2023-05-08",
      isRead: true,
    ),
  ].obs;

  void markAllAsRead() {
    notifications.forEach((notification) {
      notification.isRead = true;
    });
    notifications.refresh();
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
  }
}
