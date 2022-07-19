import 'package:flutter/material.dart';
import 'package:geprek_masdion/constants.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: Column(
          children: [
            Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Silahkan memesan menu favorite",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "pelanggan di bawah ini!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _buildAddMenuView(text: 'ADD', addEditFlag: 1, docId: '');
        },
        backgroundColor: kDefaultColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildAddMenuView(
      {required String text, required int addEditFlag, required String docId}) {
    final controller = Get.put(DashboardController());
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(kDefaultCircular),
            topLeft: Radius.circular(kDefaultCircular),
          ),
          color: kBgAccentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            16,
            16,
            16,
          ),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${text} Menu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.auto_fix_normal_outlined),
                      hintText: 'Nama Menu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kDefaultCircular),
                      ),
                    ),
                    controller: controller.nameC,
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.auto_fix_normal_outlined),
                      hintText: 'Harga Menu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kDefaultCircular),
                      ),
                    ),
                    controller: controller.hargaC,
                    validator: (value) {
                      return controller.validateHarga(value!);
                    },
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: Get.context!.width,
                      height: 40,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        text!,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        controller.saveUpdateMenu(
                          controller.nameC.text,
                          controller.hargaC.text,
                          docId!,
                          addEditFlag!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
