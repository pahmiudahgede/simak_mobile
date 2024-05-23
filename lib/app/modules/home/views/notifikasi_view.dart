import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/utility/guide.dart';
import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        judul: "Notifikasi",
        aksi: [PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'markAsRead') {
                controller.markAllAsRead();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'markAsRead',
                child: Text('Tandai semua sudah dibaca'),
              ),
            ],
          ),],
      ),
      
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 100),
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = controller.notifications[index];
                      return Card(
                        color: notification.isRead
                            ? Colors.white
                            : Colors.grey[200],
                        child: ListTile(
                          title: Text(notification.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.subtitle),
                              SizedBox(height: 5),
                              Text(
                                notification.date,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          trailing: Icon(
                            Icons.circle,
                            color: notification.isRead
                                ? Colors.transparent
                                : Colors.blue,
                            size: 10,
                          ),
                          onTap: () {
                            print("Notification tapped: ${notification.title}");
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
