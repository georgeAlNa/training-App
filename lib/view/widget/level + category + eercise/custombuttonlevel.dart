import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomButtonLevel extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonLevel(
      {Key? key, required this.text, this.onPressed, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: color,
        textColor: AppColor.blackColor,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}
