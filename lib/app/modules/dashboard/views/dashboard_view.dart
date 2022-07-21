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
            SizedBox(
              height: kDefaultPadding,
            ),
            Obx(
              () => ListView.builder(
                itemCount: controller.menus.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(controller.menus[index].name!),
                    subtitle: Text(controller.menus[index].harga!),
                    leading: CircleAvatar(
                      child: Text(
                        controller.menus[index].name!
                            .substring(0, 1)
                            .capitalize!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: kDefaultColor,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        displayDeleteDialog(controller.menus[index].docId!);
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      controller.nameC.text = controller.menus[index].name!;
                      controller.hargaC.text = controller.menus[index].harga!;
                      _buildAddMenuView(
                        text: 'UPDATE',
                        addEditFlag: 2,
                        docId: controller.menus[index].docId!,
                      );
                    },
                  ),
                ),
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
  displayDeleteDialog(String docId){
    Get.defaultDialog(
      title: "Delete Menu",
      titleStyle: TextStyle(fontSize: 18),
      middleText: "Apakah kamu yakin hapus data menu?",
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: (){},
      onConfirm: (){
        controller.deleteData(docId);
      }
    );
  }
}
