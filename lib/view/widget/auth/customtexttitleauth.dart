import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColor.yellow100Color,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
