import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geprek_masdion/app/controllers/auth_controller.dart';
import 'package:geprek_masdion/app/modules/home/views/home_view.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? name;

  var eyeClosed = true.obs;
  var eyeClosedRe = true.obs;
  bool agree = false;

  final pass = new TextEditingController();
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Wajib diisi!';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        name = val;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Wajib diisi!';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        email = val;
                      },
                      controller: controller.passwordC,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Wajib diisi!';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          password = val;
                        },
                        obscureText: eyeClosed.value,
                        controller: pass,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              eyeClosed.value = !eyeClosed.value;
                            },
                            icon: eyeClosed.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextFormField(
                        validator: (value) {
                          if (value != pass.text) {
                            return 'Password Tidak Sama';
                          }
                          return null;
                        },
                        obscureText: eyeClosedRe.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          labelText: 'Re-Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                eyeClosedRe.value = !eyeClosedRe.value;
                              },
                              icon: eyeClosedRe.value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      child: ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                          AuthController()
                              .signUp(email: email!, password: password!)
                              .then((result) {
                            if (result == null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    result,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              );
                            }
                          });
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Text('Sudah Punya Akun?'),
                        TextButton(
                          child: const Text(
                            'Login',
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
          ],
        ),
      ),
    );
  }
}
