import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/onboarding_controller.dart';
import 'package:training_app/core/constant/color.dart';
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
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                onBoaredingList[index].image!,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: double.infinity,
            margin: const EdgeInsets.only(top: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onBoaredingList[index].title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                    color: AppColor.color,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  onBoaredingList[index].body!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
        // Stack(
        //   children: [
        //     SizedBox(
        //       height: 10000,
        //       width: 5000,
        //       child: Image.asset(
        //         onBoaredingList[index].image!,
        //         height: 50,
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     Column(
        //       children: [
        //         Text(
        //           onBoaredingList[index].title!,
        //           style: const TextStyle(
        //             fontSize: 24,
        //             fontWeight: FontWeight.bold,
        //             color: AppColor.greyColor,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //         const SizedBox(
        //           height: 80,
        //         ),
        //         const SizedBox(
        //           height: 50,
        //         ),
        //         Container(
        //           alignment: Alignment.center,
        //           width: double.infinity,
        //           child: Text(
        //             onBoaredingList[index].body!,
        //             textAlign: TextAlign.center,
        //             style: const TextStyle(
        //               height: 2,
        //               color: Colors.grey,
        //               fontSize: 20,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // );
      },
    );
  }
}
