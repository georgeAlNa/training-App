// ignore: file_names
import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';

class CustomAppBarAuth extends StatelessWidget {
  final String title;
  final Widget body;

  const CustomAppBarAuth({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: AppColor.yellowColor,
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
        backgroundColor: AppColor.blackColor,
        leading: const CircleAvatar(
          radius: 5,
          backgroundImage: AssetImage(
            AppImageAsset.logo,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //     ),
        //     iconSize: 30,
        //     onPressed: () {
        //       Get.back();
        //     },
        //   ),
        // ],
      ),
      body: body,
    );
  }
}
