// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

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
          child: SingleChildScrollView( // Added SingleChildScrollView
            child: Container(
              margin: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => CircleAvatar(
                          backgroundImage: controller.isProfilepickPathset.value == true
                              ? FileImage(File(controller.profilePicPath.value)) as ImageProvider
                              : AssetImage("assets/icon/icon_simak.png"),
                          radius: 50,
                        ),
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
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => controller.bottomSheet(context),
                          );
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
                    tipeinput: TextInputType.text,
                    controller: controller.textController1,
                  ),
                  controller.formEditProfile(
                    labeltxt: "nomor hp",
                    prefikon: Icons.smartphone,
                    tipeinput: TextInputType.phone,
                    controller: controller.textController2,
                  ),
                  controller.formEditProfile(
                    labeltxt: "Deskripsi",
                    prefikon: Icons.list_alt_outlined,
                    tipeinput: TextInputType.text,
                    controller: controller.textController3,
                  ),
                ],
              ),
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
