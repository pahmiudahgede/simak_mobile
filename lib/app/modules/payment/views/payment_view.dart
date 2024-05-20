import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pembayaran'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  controller.gesturTekan(
                    isSelected: controller.allButtonSelected,
                    onTap: () => controller.allButtonClicked(),
                    textfilter: "Semua",
                  ),
                  SizedBox(width: 10),
                  controller.gesturTekan(
                    isSelected: controller.leftButtonSelected,
                    onTap: () => controller.leftButtonClicked(),
                    textfilter: "Lunas",
                  ),
                  SizedBox(width: 10),
                  controller.gesturTekan(
                    isSelected: controller.rightButtonSelected,
                    onTap: () => controller.rightButtonClicked(),
                    textfilter: "Belum Lunas",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: controller.filteredPayments.length,
                    itemBuilder: (context, index) {
                      final payment = controller.filteredPayments[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(payment.name[0]),
                          ),
                          title: Text(payment.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ruang: ${payment.room}'),
                              Text('Tanggal: ${payment.date}'),
                            ],
                          ),
                          trailing: Text(
                            payment.isPaid ? 'Lunas' : 'Belum Lunas',
                            style: TextStyle(
                              color: payment.isPaid ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            controller.showDetailDialog(context, payment);
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
