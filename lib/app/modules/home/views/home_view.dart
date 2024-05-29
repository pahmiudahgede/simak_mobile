import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:simak/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';
import '../../../widget/utility/guide.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "SIMAK",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Werno.putih,
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Werno.putih,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 9,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.photo),
                  // backgroundImage: AssetImage(assetName),
                ),
                SizedBox(width: 15),
                Text(
                  'Halo, ${SpUtil.getString("username")} !',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.HomeListIcon(
                                  warna: Werno.utama,
                                  objicon: ikone.penghuni,
                                  jumlahx:
                                      controller.penghuniList.length.toString(),
                                  iconcaption: "Penghuni",
                                ),
                                controller.HomeListIcon(
                                  warna: Werno.biru,
                                  objicon: ikone.kamar,
                                  jumlahx:
                                      controller.ruangList.length.toString(),
                                  iconcaption: "Kamar",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.HomeListIcon(
                                  warna: Werno.hijau,
                                  objicon: ikone.lunas,
                                  jumlahx: controller
                                      .filteredPaymentslunas.length
                                      .toString(),
                                  iconcaption: "Lunas",
                                ),
                                controller.HomeListIcon(
                                  warna: Werno.merah,
                                  objicon: ikone.blmLunas,
                                  jumlahx: controller
                                      .filteredPaymentsblmlunas.length
                                      .toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pengumuman",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Werno.hitam,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  icon: Icon(
                                    ikone.lainX,
                                    color: Werno.hitam,
                                  ),
                                  onSelected: (String value) {
                                    if (value == 'Buat Pengumuman') {
                                      controller.buatPengumumanForm(context);
                                    } else if (value ==
                                        'Hapus Semua Pengumuman') {
                                      controller.deleteAll();
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return {
                                      'Buat Pengumuman',
                                      'Hapus Semua Pengumuman'
                                    }.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Obx(
                                () {
                                  if (controller.pengumumans.isEmpty) {
                                    return Center(
                                      child: Text('Tidak ada pengumuman'),
                                    );
                                  } else {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.pengumumans.length,
                                      itemBuilder: (context, index) {
                                        var pengumuman =
                                            controller.pengumumans[index];
                                        return Card(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                              dividerColor: Colors.transparent,
                                            ),
                                            child: ExpansionTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    pengumuman.judul,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16, left: 16),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        pengumuman.deskripsi,
                                                      ),
                                                      SizedBox(height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          IconButton(
                                                            icon: Icon(
                                                                Icons.edit,
                                                                color: Werno
                                                                    .abujanda),
                                                            onPressed: () {
                                                              controller
                                                                  .editPengumumanForm(
                                                                      context,
                                                                      index,
                                                                      pengumuman);
                                                            },
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                                Icons.delete,
                                                                color: Werno
                                                                    .abujanda),
                                                            onPressed: () {
                                                              controller.delete(
                                                                  pengumuman
                                                                      .id);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
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
        ],
      ),
    );
  }
}
