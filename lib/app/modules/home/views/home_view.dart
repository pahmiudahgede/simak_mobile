import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:simak/app/routes/app_pages.dart';
import '../../../widget/utility/guide.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: "Hai, ",
            style: TextStyle(
              color: Werno.putih,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: "Admin",
                style: TextStyle(
                  color: Werno.putih,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.HOMENOTIF),
            child: Container(
              margin: EdgeInsets.only(right: 20),
              width: 30,
              height: 30,
              child: Icon(
                Icons.notifications_active,
                color: Werno.putih,
              ),
            ),
          ),
        ],
        backgroundColor: Werno.utama,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              color: Werno.utama,
            ),
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            // color: Colors.amber,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Werno.utamaPudar,
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xFFE52D27),
                          //     Color(0xFFB31217),
                          //   ],
                          // ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pencarian",
                                  style: TextStyle(
                                    color: Werno.hitam,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Icon(
                                //   Icons.more_horiz,
                                //   color: Werno.hitam,
                                // ),
                              ],
                            ),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Masukkan kata kunci pencarian',
                                hintStyle: TextStyle(color: Werno.hitam),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Werno.hitam),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Werno.putih,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Werno.hitam,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              onChanged: (value) {
                                // Lakukan sesuatu dengan nilai yang diubah
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 10,
                //   color: Colors.yellow,
                // ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  right: 30,
                                  left: 30,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        controller.HomeListIcon(
                                          warna: Werno.utama,
                                          objicon: ikone.penghuni,
                                          jumlahx: "20",
                                          iconcaption: "Penghuni",
                                        ),
                                        controller.HomeListIcon(
                                          warna: Werno.biru,
                                          objicon: ikone.kamar,
                                          jumlahx: "20",
                                          iconcaption: "Kamar",
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        controller.HomeListIcon(
                                          warna: Werno.merah,
                                          objicon: ikone.blmLunas,
                                          jumlahx: "20",
                                          iconcaption: "Lunas",
                                        ),
                                        controller.HomeListIcon(
                                          warna: Werno.hijau,
                                          objicon: ikone.lunas,
                                          jumlahx: "0",
                                          iconcaption: "Belum Lunas",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                color: Werno.abuprawan,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15,
                                  right: 20,
                                  left: 20,
                                  bottom: 100,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Pengumuman",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Werno.hitam,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          ikone.panah,
                                          color: Werno.hitam,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Hari ini kami presentasi",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
