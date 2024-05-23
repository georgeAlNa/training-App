import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';

class Container3 extends StatelessWidget {
  final text;
  final page;

  const Container3({super.key, this.text, this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(page);
      },
      child: Container(
        height: 60,
        width: 400,
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColor.blackColor,
          border: Border.all(
            color: AppColor.color,
            width: 5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(40000),
          ),
        ),
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(
              fontSize: 18,
              color: AppColor.yellow100Color,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
