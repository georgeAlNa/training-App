import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/onboarding_controller.dart';
import 'package:training_app/data/datasource/static/static_on_boarding.dart';

class PageViewOnBoarding extends GetView<OnBoardingControllerImp> {
  const PageViewOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChange(value);
        print(value);
      },
      itemCount: onBoaredingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(
              onBoaredingList[index].title!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(onBoaredingList[index].image!),
            const SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                onBoaredingList[index].descripe!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 2,
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
