// ignore_for_file: must_be_immutable

import 'package:fl_app/controller/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class HeaderTile extends StatelessWidget {
  HeaderTile({super.key});
  var controller = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:93.0,vertical: 20),
      child: Center(
        child: Image.asset("assets/images/cinemaven.png"),
      ),
    );
  }
}
