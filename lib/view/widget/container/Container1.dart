import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';

class Container1 extends StatelessWidget {
  final text;
  final page;
  const Container1({super.key, this.text, this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(page);
      },
      child: Container(
        height: 60,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.color, width: 5),
          borderRadius: const BorderRadius.all(
            Radius.circular(40000),
          ),
        ),
        child: Text(
          "$text",
          style: const TextStyle(fontSize: 40, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
