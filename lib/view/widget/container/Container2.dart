import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class Container2 extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const Container2({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 500,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.blackColor,
          border: Border.all(color: AppColor.color, width: 5),
          borderRadius: const BorderRadius.all(
            Radius.circular(40000),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColor.yellow100Color,
            ),
          ),
        ),
      ),
    );
  }
}
