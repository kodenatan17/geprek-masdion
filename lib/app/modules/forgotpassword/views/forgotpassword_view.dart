import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
  const ForgotpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding * 2,
                left: kDefaultPadding * 2,
              ),
              child: Image.asset(
                "assets/images/icon.png",
                width: Get.width,
                height: Get.width / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: kDefaultPadding * 2,
            ),
            Container(
              padding: EdgeInsets.only(
                top: kDefaultPadding,
                left: kDefaultPadding * 3.5,
                right: kDefaultPadding * 3.5,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: controller.nameC,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    controller: controller.passwordC,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    controller: controller.passwordC,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Re-Password',
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    width: Get.width,
                    child: ElevatedButton(
                      child: const Text('Process'),
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Text('Belum Punya Akun?'),
                      TextButton(
                        child: const Text(
                          'Daftar',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: kDefaultPadding * 3.5,
                right: kDefaultPadding * 3.5,
              ),
              child: Positioned(
                top: 0,
                left: 0,
                bottom: kDefaultPadding,
                child: Lottie.asset("assets/lottie/login.json",
                    width: Get.width * 0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
