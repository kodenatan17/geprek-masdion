import 'package:flutter/material.dart';
import 'package:geprek_masdion/app/controllers/auth_controller.dart';
import 'package:geprek_masdion/app/modules/contact/views/contact_view.dart';
import 'package:geprek_masdion/app/modules/dashboard/views/dashboard_view.dart';
import 'package:geprek_masdion/app/modules/login/views/login_view.dart';
import 'package:geprek_masdion/app/modules/menu/views/menu_view.dart';
import 'package:geprek_masdion/constants.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_active_rounded,
                  color: kDefaultColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  AuthController().singOut().then(
                        (_) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                        ),
                      );
                },
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: kDefaultColor,
                ),
              ),
            ],
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text('Hi, Ferry Natan!'),
                ],
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black87,
              indicatorColor: kDefaultColor,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'Menu',
                ),
                Tab(
                  text: 'Contact',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DashboardView(),
              MenuView(),
              ContactView(),
            ],
          ),
        ),
      );
}
