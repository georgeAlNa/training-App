import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomButtonPlanDetail extends StatelessWidget {
  final String textTitle;
  final String textSubject;
  final String textDate;
  final String textVideo;
  final String textId;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonPlanDetail(
      {Key? key,
      required this.textTitle,
      this.onPressed,
      required this.color,
      required this.textSubject,
      required this.textDate,
      required this.textVideo,
      required this.textId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          // color: AppColor.blackColor,
          border: Border.all(
            color: color,
            width: 3,
          ),
          color: AppColor.black54Color,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColor.yellowForDesign,
                ),
              ),
              Text(
                textId,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.videocam,
                    color: AppColor.color,
                  ),
                  Text(
                    textVideo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
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
        ),
      ),
    );
  }
}
