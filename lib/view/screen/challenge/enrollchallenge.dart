import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/challenge/enrollchallenge_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:url_launcher/url_launcher.dart';

class EnrollChallengePage extends StatelessWidget {
  const EnrollChallengePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EnrollChallengeControllerImp());
    return GetBuilder<EnrollChallengeControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: AppColor.blackColor,
            ),
            title: controller.enrollChallengeMap.isEmpty
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: AppColor.blackColor,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    '${controller.enrollChallengeMap['Challenge_name']}',
                    style: const TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            backgroundColor: AppColor.color,
          ),
          body: Stack(
            children: [
              SizedBox(
                height: 50000,
                child: Image.asset(
                  AppImageAsset.challeng,
                  fit: BoxFit.fill,
                ),
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: controller.pageController,
                        onPageChanged: (value) {
                          controller.onPageChange(value);
                          print(value);
                        },
                        itemCount:
                            controller.enrollChallengeExerciseList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                '${controller.enrollChallengeExerciseList[index]['name']}\n',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.yellow100Color,
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              // controller.enrollChallengeExerciseList[index]['date']
                              Text(
                                'Date of All Challenge : ${controller.timeLeft.toString()}\n',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.yellowColor,
                                ),
                              ),
                              Text(
                                'Date of this exercise : ${controller.enrollChallengeExerciseList[index]['date']}\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.yellow100Color
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Show On Youtube  : ',
                                    style: TextStyle(
                                      color: AppColor.yellow100Color,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.videocam,
                                      color: AppColor.yellowColor,
                                    ),
                                    onPressed: () async {
                                      await launchUrl(
                                        Uri.parse(
                                          '${controller.enrollChallengeExerciseList[index]['video']}',
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),

                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: Text(
                                  '${controller.enrollChallengeExerciseList[index]['description']}\n',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Positioned(
                        height: 55,
                        bottom: 60,
                        right: 90,
                        width: 200,
                        child: CustomButtonAuth(
                          text: 'Start timer of challenge',
                          color: AppColor.color,
                          onPressed: () {
                            controller.startTimerCountDown();
                          },
                        ),
                      ),
                      Positioned(
                        height: 55,
                        bottom: 10,
                        right: 111.9,
                        width: 150,
                        child: CustomButtonAuth(
                          text: 'Next Exercise',
                          color: AppColor.yellow100Color,
                          onPressed: () {
                            controller.nextExercise();
                            //print('${controller.nextExercise()}');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
