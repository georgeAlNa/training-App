import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';

Future<bool> alertDialog() {
  Get.defaultDialog(
    title: 'Alert !!',
    middleText: 'Are You sure you want exit',
    actions: [
      MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColor.red2Color,
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColor.color,
        onPressed: () {
          exit(0);
        },
        child: const Text(
          'Confirm',
          style: TextStyle(
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
  return Future.value(true);
}
