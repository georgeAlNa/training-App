import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomCardUserInfo extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomCardUserInfo({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      color: AppColor.yellowColor,
      child: ListTile(
        leading: Icon(
          icon,
          size: 25,
          color: AppColor.blackColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
