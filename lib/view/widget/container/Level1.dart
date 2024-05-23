import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';

class Level1 extends StatelessWidget {
  final title;

  const Level1({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("category");
      },
      child: Container(
        width: 40,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.color, width: 5),
          borderRadius: const BorderRadius.all(
            Radius.circular(40000),
          ),
        ),
        child: Text(
          "   $title",
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
