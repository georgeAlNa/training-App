import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomButtonSearch extends StatelessWidget {
  final String textTitle;
  final String textSubject;
  final String textDate;
  final String textVideo;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonSearch(
      {Key? key,
      required this.textTitle,
      this.onPressed,
      required this.color,
      required this.textSubject,
      required this.textDate,
      required this.textVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColor.black54Color,
          border: Border.all(
            color: AppColor.color,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Text(
              textTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColor.yellowForDesign,
              ),
            ),
            Text(
              textSubject,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColor.yellow100Color,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              textDate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColor.yellowForDesign,
              ),
            ),
            Text(
              textVideo,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
