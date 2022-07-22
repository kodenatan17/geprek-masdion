import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/pelangganModel.dart';
import '../../../widgets/customFullScreenDialog.dart';
import '../../../widgets/customSnackBar.dart';

class MenuController extends GetxController {
  //TODO: Implement MenuController

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final phoneC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collRefference;
  RxList<PelangganModel> menus = RxList<PelangganModel>([]);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    collRefference = firestore.collection("members");
    menus.bindStream(getAllMenus());
  }

  @override
  void onClose() {
    super.onClose();
    nameC.dispose();
    phoneC.dispose();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Nama wajib diisi";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return "Handphone wajib diisi";
    }
    return null;
  }

  void saveUpdateMenu(
    String name,
    String phone,
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
      collRefference.add({'name': name, 'phone': phone}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Member Ditambahkan",
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
          .update({'name': name, 'phone': phone}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Member Updated",
            message: "Member Diupdate",
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
    phoneC.clear();
  }

  Stream<List<PelangganModel>> getAllMenus() => collRefference.snapshots().map(
      (query) => query.docs.map((item) => PelangganModel.fromMap(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collRefference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      clearEditingControllers();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Member Dihapus",
          message: "Berhasil menghapus Member",
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
