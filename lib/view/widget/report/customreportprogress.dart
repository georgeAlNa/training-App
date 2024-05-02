import 'package:flutter/material.dart';

class CustomReportProgress extends StatelessWidget {
  final String textCurrentweight;
  final String textAge;
  final String textHeight;
  final String textGender;
  final String textTargetWeight;
  final String textTimeToReachTheSpecifiedWeight;
  final String textCalories;
  final Color color;
  final void Function()? onPressed;
  const CustomReportProgress({
    Key? key,
    required this.textCurrentweight,
    required this.textAge,
    required this.textHeight,
    required this.textGender,
    required this.textTargetWeight,
    required this.textTimeToReachTheSpecifiedWeight,
    required this.textCalories,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(13),
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Column(
          children: [
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
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textHeight,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textGender,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textTargetWeight,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textTimeToReachTheSpecifiedWeight,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textCalories,
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
