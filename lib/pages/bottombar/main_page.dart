
import 'package:fl_app/constants/constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/pages/favourite_page.dart';
import 'package:fl_app/pages/home_page.dart';
import 'package:fl_app/pages/profile_page.dart';
import 'package:fl_app/pages/search_page.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   var controller = Get.put(MovieController());
  List pages = [ HomePage(), SearchPage(),  FavouritesPage(),  const ProfilePage()];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Obx(() => pages[controller.currentIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              
              backgroundColor: Colours.scaffoldBgColor,
              onTap: controller.onTap,
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.search), label: "search"),
                    BottomNavigationBarItem(
                    icon: Icon(IconlyLight.heart), label: "fav"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: "profile"),
              ]),
        ));
  }
}
