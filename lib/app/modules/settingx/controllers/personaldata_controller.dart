import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonaldataController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();

  formEditProfile({
    TextEditingController? controller,
    String? labeltxt,
    IconData? prefikon,
    TextInputType? tipeinput,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "${labeltxt}",
                prefixIcon: Icon(prefikon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: tipeinput,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Camera'),
            onTap: () {
              // Handle camera action
              // Navigator.pop(context);
              Get.back();
              // Add your camera functionality here
              // print('Camera selected');
              takePhoto(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Gallery'),
            onTap: () {
              // Handle gallery action
              Get.back();
              // Add your gallery functionality here
              // print('Gallery selected');
              takePhoto(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  var isProfilepickPathset = false.obs;
  var profilePicPath = "".obs;

  Future<void> takePhoto(ImageSource source) async {
    try {
      final pickedImage = await imagePicker.pickImage(
        source: source,
        imageQuality: 100,
      );

      if (pickedImage != null) {
        pickedFile = File(pickedImage.path);
        setProfileImage(pickedFile!.path);
        Get.snackbar(
          'Success',
          'Profile picture updated successfully',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Error',
          'No image selected',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void setProfileImage(String path) {
    profilePicPath.value = path;
    isProfilepickPathset.value = true;
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
