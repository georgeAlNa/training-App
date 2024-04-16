import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/onboarding_controller.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/data/datasource/static/static_on_boarding.dart';

class DotContainerOnBoarding extends GetView<OnBoardingControllerImp> {
  const DotContainerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoaredingList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: controller.currentPage == index ? 7 : 5,
              width: controller.currentPage == index ? 20 : 8,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
