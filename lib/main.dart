import 'package:fl_app/views/bottombar/main_page.dart';
import 'package:fl_app/views/details_page.dart';
import 'package:fl_app/views/home_page.dart';
import 'package:fl_app/views/login_page.dart';
import 'package:fl_app/views/splash/splash_screen.dart';
import 'package:fl_app/utils/themes/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';


Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CineMaven',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      debugShowCheckedModeBanner: false,
     // home: SplashPage(),
      initialRoute: '/main',
      getPages: [
       GetPage(name: '/splash', page: () => const SplashPage()),
       GetPage(name: '/login', page: () => const LoginPage()),
       GetPage(name: '/main', page: () => const MainPage()),
       GetPage(name: '/home', page: () =>  HomePage()),
       GetPage(name: '/deatils', page: () =>  DetailsPage()),
      ],
    );
  }
}
