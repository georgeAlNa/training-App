import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

// ignore: must_be_immutable
class CustomButtonLanguage extends StatelessWidget {
  const CustomButtonLanguage(
      {super.key, required this.langType, required this.onPressed});
  final String langType;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: onPressed,
        color: AppColor.color,
        child: Text(
          langType,
          style: const TextStyle(
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
