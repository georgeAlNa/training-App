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
    return Container(
      width: 250,
      height: 50,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        child: Text(
          langType,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
