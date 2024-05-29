import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/utility/guide.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        judul: "Riwayat Pembayaran",
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
                    padding: EdgeInsets.all(5.0),
                    itemCount: controller.filteredPayments.length,
                    itemBuilder: (context, index) {
                      final payment = controller.filteredPayments[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                                payment.ruang?.namaRuang ?? 'Unknown Room'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Displaying the list of penghunis (occupants)
                                ...?payment.ruang?.penghunis
                                    ?.map((penghuni) => Text(penghuni.nama))
                                    .toList(),
                                Text(
                                    'Tanggal: ${payment.tanggal ?? 'Unknown Date'}'),
                                Text(
                                    'Jumlah Tagihan: Rp. ${payment.jumlahTagihan?.toStringAsFixed(0) ?? 'Unknown Amount'}'),
                              ],
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  payment.status == 'Lunas'
                                      ? 'Lunas      '
                                      : 'Belum Lunas',
                                  style: TextStyle(
                                    color: payment.status == 'Lunas'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                      ),
                                      onPressed: () {
                                        controller.showDetailDialog(
                                            context, payment);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.remove_red_eye),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
