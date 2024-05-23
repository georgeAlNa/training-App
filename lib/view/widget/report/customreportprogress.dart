import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/container/Container2.dart';

class CustomReportProgress extends StatelessWidget {
  final String textTitle;
  final String textCurrentweight;
  final String textAge;
  final String textHeight;
  final String textGender;
  final String textTargetWeight;
  final String textTimeToReachTheSpecifiedWeight;
  final String textCalories;
  final String textCreatedAt;
  final Color color;
  final void Function()? onPressed;
  const CustomReportProgress({
    Key? key,
    required this.textTitle,
    required this.textCurrentweight,
    required this.textAge,
    required this.textHeight,
    required this.textGender,
    required this.textTargetWeight,
    required this.textTimeToReachTheSpecifiedWeight,
    required this.textCalories,
    required this.textCreatedAt,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColor.black54Color,
          border: Border.all(
            color: AppColor.greyColor,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 1,
              right: -20,
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
              left: 70,
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
                Container2(
                  title: textTitle,
                  onTap: () {},
                ),
                Text(
                  textCurrentweight,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  textAge,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  textHeight,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  textGender,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  textTargetWeight,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  textTimeToReachTheSpecifiedWeight,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  textCalories,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  textCreatedAt,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
