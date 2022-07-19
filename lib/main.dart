import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //   title: "Application",
      //   initialRoute: AppPages.INITIAL,
      //   getPages: AppPages.routes,
      // );

      title: "Geprek Mas Dion",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
