import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertDialog() {
  Get.defaultDialog(
    title: 'Alert',
    middleText: 'Are You sure you want exit',
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text('Confirm'),
      ),
    ],
  );
  return Future.value(true);
}
