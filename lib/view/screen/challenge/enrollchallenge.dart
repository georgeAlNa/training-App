import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/challenge/enrollchallenge_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class EnrollChallengePage extends StatelessWidget {
  const EnrollChallengePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EnrollChallengeControllerImp());
    return GetBuilder<EnrollChallengeControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: controller.enrollChallengeMap.isEmpty
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: AppColor.whiteColor,
                      strokeWidth: 2,
                    ),
                  )
                : Text('${controller.enrollChallengeMap['Challenge_name']}'),
            backgroundColor: AppColor.primaryColor,
          ),
          body: HandlingDataView(
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
                    itemCount: controller.enrollChallengeExerciseList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            'Name : ${controller.enrollChallengeExerciseList[index]['name']}\n',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          // controller.enrollChallengeExerciseList[index]['date']
                          Text(
                            'Date of All Challenge : ${controller.timeLeft.toString()}\n',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Date of this exercise : ${controller.enrollChallengeExerciseList[index]['date']}\n',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              'Descripe : ${controller.enrollChallengeExerciseList[index]['description']}\n',
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
                      color: AppColor.blueColor,
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
                      color: AppColor.primaryColor,
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
        );
      },
    );
  }
}
