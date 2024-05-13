import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

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
              color: Colors.white,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: "Admin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20),
              width: 30,
              height: 30,
              child: Icon(
                Icons.notification_important_sharp,
                color: Color.fromARGB(255, 9, 1, 255),
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 242, 4, 234),
        elevation: 0,
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.amberAccent,
      //   onTap: controller.ChangeTabIndex,
      //   currentIndex: controller.tabIndex,
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   items: [
      //     _bottomNavigationBar(
      //       ikon: Icons.question_mark,
      //       label: 'page1',
      //     ),
      //     _bottomNavigationBar(
      //       ikon: Icons.question_mark,
      //       label: 'page2',
      //     ),
      //     _bottomNavigationBar(
      //       ikon: Icons.question_mark,
      //       label: 'page3',
      //     ),
      //     _bottomNavigationBar(
      //       ikon: Icons.question_mark,
      //       label: 'page4',
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              color: Color.fromARGB(255, 242, 4, 234),
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
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE52D27),
                              Color(0xFFB31217),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pencarian",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Image.asset("assets/logo/simpati.png"),
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Masukkan kata kunci pencarian',
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.2),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
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
                    // color: Colors.purple,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Dashboard(
                                    objicon:
                                        Icons.supervised_user_circle_rounded,
                                    iconcaption: "penghuni",
                                  ),
                                  Dashboard(
                                    objicon:
                                        Icons.supervised_user_circle_rounded,
                                    iconcaption: "penghuni",
                                  ),
                                  Dashboard(
                                    objicon:
                                        Icons.supervised_user_circle_rounded,
                                    iconcaption: "penghuni",
                                  ),
                                ],
                              ),
                              Container(
                                height: 20,
                                color: Colors.red,
                                // cuma batas
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '-- garis pembatas --',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20, left: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Data Penghuni",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Fahmi Kurniawan",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "Fahmi Kurniawan",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "Fahmi Kurniawan",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
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

// _bottomNavigationBar({IconData? ikon, String? label}) {
//   return BottomNavigationBarItem(icon: Icon(ikon), label: label);
// }

class Dashboard extends StatelessWidget {
  final String iconcaption;
  final IconData objicon;
  const Dashboard({required this.iconcaption, required this.objicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(objicon),
            Text(iconcaption),
          ],
        ),
      ),
    );
  }
}
