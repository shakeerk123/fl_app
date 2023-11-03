// ignore_for_file: must_be_immutable

import 'package:fl_app/controller/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderTile extends StatelessWidget {
  HeaderTile({super.key});
  var controller = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 12, right: 12, bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Hello, ', style: GoogleFonts.raleway(fontSize: 25)),
                      Text('User',
                          style: GoogleFonts.raleway(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('All your fav is here, ',
                      style: GoogleFonts.raleway(
                          fontSize: 12, color: Colors.grey)),
                ],
              ),
              Obx(
                () => IconButton(
                  onPressed: () {
                    Get.changeThemeMode(controller.changeTheme());
                  },
                  icon: Icon(
                    controller.themeMode.value == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
