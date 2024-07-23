import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomAllAdviceRequestByCoachWidget extends StatelessWidget {
  final String title;

  const CustomAllAdviceRequestByCoachWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.black54Color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.color,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColor.yellow100Color,
          ),
        ),
      ),
    );
  }
}
