import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomButtonChallengeDetail extends StatelessWidget {
  final String textTitle;
  final String textSubject;
  final String textDate;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonChallengeDetail(
      {Key? key,
      required this.textTitle,
      this.onPressed,
      required this.color,
      required this.textSubject,
      required this.textDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.black54Color,
        border: Border.all(
          color: color,
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned(
            bottom: -100,
            left: -20,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.yellowForDesign,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 100,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColor.yellowForDesign2,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
          Column(
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColor.yellow100Color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
