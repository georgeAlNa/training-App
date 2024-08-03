import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/imageasset.dart';
// import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/screen/challenge/allchallenge.dart';
import 'package:training_app/view/screen/chat/chat.dart';
import 'package:training_app/view/screen/plans/gotoplans.dart';
import 'package:training_app/view/widget/container/Container2.dart';

class ChallengeAndPlanAndChat extends StatelessWidget {
  const ChallengeAndPlanAndChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(1),
      child: Stack(
        children: [
          SizedBox(
            height: 5000,
            child: Image.asset(
              AppImageAsset.sport,
              fit: BoxFit.fill,
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         AppColor.blackColor,
          //         AppColor.whiteColor,
          //         AppColor.greyColor,
          //         AppColor.yellow100Color,
          //         // AppColor.yellowColor,
          //       ],
          //       stops: const [0.7, 0.2, 0.2, 0.2],
          //       // transform: const GradientRotation(100),
          //     ),
          //   ),
          // ),

          Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Center(
                child: Container2(
                  title: "Challenge",
                  onTap: () {
                    Get.to(const AllChallengePage());
                  },
                ),
              ),
              Center(
                child: Container2(
                  title: "Plans",
                  onTap: () {
                    Get.to(const AllPlanPage());
                  },
                ),
              ),
              Center(
                child: Container2(
                  title: "Ask Chat GPT",
                  onTap: () {
                    Get.to(ChatPage());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
