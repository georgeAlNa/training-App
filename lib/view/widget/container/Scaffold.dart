// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';

class Scaffold1 extends StatelessWidget {
  final String title;
  final Widget body;

  const Scaffold1({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 20,
                offset: Offset(1, 1),
                color: AppColor.greyColor,
              ),
            ],
          ),
        ),
        backgroundColor: AppColor.color,
        leading: const CircleAvatar(
          radius: 5,
          backgroundImage: AssetImage(
            "assets/images/logo.png",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            iconSize: 30,
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: body,
    );
  }
}
