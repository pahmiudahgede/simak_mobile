import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:simak/app/modules/operasi/controllers/operasi_controller.dart';

// import 'package:simak/app/modules/operasi/views/operation_important_view.dart';

// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

import '../../../widget/utility/guide.dart';

class OperasiView extends GetView<OperasiController> {
  const OperasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        accent: Werno.utama,
        backButton: false,
        locale: 'id',
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      body: paymentview(),
    );
  }
}

class paymentview extends StatefulWidget {
  const paymentview({super.key});

  @override
  State<paymentview> createState() => _paymentviewState();
}

class _paymentviewState extends State<paymentview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.download, color: Werno.hijau),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 252, 252, 1),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pemasukan",
                            style: GoogleFonts.montserrat(
                                color: Werno.putih, fontSize: 12),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Rp 5.000.000",
                            style: GoogleFonts.montserrat(
                                color: Werno.putih, fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.upload, color: Werno.merah),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 252, 252, 1),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pengeluaran",
                            style: GoogleFonts.montserrat(
                                color: Werno.putih, fontSize: 12),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Rp 5.000.000",
                            style: GoogleFonts.montserrat(
                                color: Werno.putih, fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Transaction",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Werno.utama,
              ),
            ),
          )
        ],
      )),
    );
  }
}
