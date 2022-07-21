import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geprek_masdion/constants.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showSnackBar({
    required BuildContext? context,
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      messageText: Text(
        message,
        style: TextStyle(fontSize: 16),
      ),
      titleText: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      borderRadius: kDefaultCircular,
      margin: const EdgeInsets.all(kDefaultPadding),
    );
  }
}
