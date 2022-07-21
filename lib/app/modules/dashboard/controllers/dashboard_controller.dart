import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geprek_masdion/app/data/menuModel.dart';
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
  RxList<MenuModel> menus = RxList<MenuModel>([]);

  // XFile? pickedImage = null;

  @override
  void onInit() {
    super.onInit();
    // imagePicker = ImagePicker();
    collRefference = firestore.collection("menus");
    menus.bindStream(getAllMenus());
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
    } else if (addEditFlag == 2) {
      CustomFullScreenDialog.showDialog();
      collRefference
          .doc(docId)
          .update({'name': name, 'harga': harga}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Menu Updated",
            message: "Menu Diupdate",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Terjadi Kesalahan",
            backgroundColor: Colors.red);
      });
    }
  }

  void clearEditingControllers() {
    nameC.clear();
    hargaC.clear();
  }

  Stream<List<MenuModel>> getAllMenus() => collRefference.snapshots().map(
      (query) => query.docs.map((item) => MenuModel.fromMap(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collRefference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      clearEditingControllers();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Menu Dihapus",
          message: "Berhasil menghapus menu",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Terjadi Kesalahan",
          backgroundColor: Colors.red);
    });
  }
}
