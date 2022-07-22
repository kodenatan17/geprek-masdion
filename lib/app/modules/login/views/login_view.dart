import 'package:flutter/material.dart';
import 'package:geprek_masdion/app/controllers/auth_controller.dart';
import 'package:geprek_masdion/app/modules/home/views/home_view.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  var eyeClosed = true.obs;

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Wajib diisi!';
                        }
                        return null;
                      }),
                      onSaved: ((newValue) {
                        email = newValue;
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextFormField(
                        obscureText: eyeClosed.value,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'Wajib diisi!';
                          }
                          return null;
                        }),
                        onSaved: ((newValue) {
                          password = newValue;
                        }),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              eyeClosed.value = !eyeClosed.value;
                            },
                            icon: eyeClosed.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.FORGOTPASSWORD);
                      },
                      child: const Text(
                        'Lupa Password',
                      ),
                    ),
                    Container(
                      width: Get.width,
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                          AuthController()
                              .signIn(email: email!, password: password!)
                              .then((result) {
                            if (result == null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  result,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ));
                            }
                          });
                        },
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
            ),
            Container(
              padding: EdgeInsets.only(
                top: kDefaultPadding,
                left: kDefaultPadding * 3.5,
                right: kDefaultPadding * 3.5,
              ),
              child: Positioned(
                top: 0,
                left: 0,
                bottom: kDefaultPadding,
                child: Lottie.asset("assets/lottie/login.json",
                    width: Get.width * 0.45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
