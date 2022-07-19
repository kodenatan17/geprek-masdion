import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/customFullScreenDialog.dart';
import '../../../widgets/customSnackBar.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final hargaC = TextEditingController();
  // late ImagePicker imagePicker;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collRefference;

  // XFile? pickedImage = null;

  @override
  void oninit() {
    super.onInit();
    // imagePicker = ImagePicker();
    collRefference = firestore.collection("menus");
  }

  @override
  void onClose() {
    nameC.dispose();
    hargaC.dispose();
    super.onClose();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Nama wajib diisi";
    }
    return null;
  }

  String? validateHarga(String value) {
    if (value.isEmpty) {
      return "Harga wajib diisi";
    }
    return null;
  }

  // void resetImage() {
  //   pickedImage = null;
  //   update();
  // }

  // void selectImage() async {
  //   try {
  //     final checkDataImage =
  //         await imagePicker.pickImage(source: ImageSource.gallery);
  //     if (checkDataImage != null) {
  //       pickedImage = checkDataImage;
  //     }
  //     update();
  //   } catch (err) {
  //     print(err);
  //     pickedImage = null;
  //     update();
  //   }
  // }
  void saveUpdateMenu(
    String name,
    String harga,
    String docId,
    int addEditFlag,
  ) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();
      collRefference.add({'name': name, 'harga': harga}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Menu Ditambahkan",
          message: "Berhasil Ditambahkan",
          backgroundColor: Colors.green,
        );
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Terjadi Kesalahan",
          backgroundColor: Colors.red,
        );
      });
    }
  }

  void clearEditingControllers() {
    nameC.clear();
    hargaC.clear();
  }
}
