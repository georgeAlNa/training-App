import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/onboarding_controller.dart';
import 'package:training_app/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   margin: const EdgeInsets.only(bottom: 60),
        //   color: AppColor.primaryColor,
        //   child: MaterialButton(
        //     padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        //     onPressed: () {
        //       controller.next();
        //     },
        //     child: Text(
        //       '8'.tr,
        //       style: const TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 18,
        //       ),
        //     ),
        //   ),
        // );

        Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: MaterialButton(
          onPressed: () {
            controller.next();
          },
          color: AppColor.color,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: const SizedBox(
            height: 33,
            width: 200,
            child: Center(
              child: Text(
                "Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
