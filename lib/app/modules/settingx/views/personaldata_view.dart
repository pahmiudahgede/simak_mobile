import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/personaldata_controller.dart';

class PersonaldataView extends GetView<PersonaldataController> {
  const PersonaldataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Pribadi'),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icon/icon_simak.png"),
                    radius: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit_square),
                  TextButton(
                    onPressed: () {
                      print("edit profile");
                    },
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              controller.formEditProfile(
                labeltxt: "nama",
                prefikon: Icons.person,
              ),
              controller.formEditProfile(
                labeltxt: "nomor hp",
                prefikon: Icons.smartphone,
              ),
              controller.formEditProfile(
                labeltxt: "Deskripsi",
                prefikon: Icons.list_alt_outlined,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("simpan perubahan"),
      ),
    );
  }
}
