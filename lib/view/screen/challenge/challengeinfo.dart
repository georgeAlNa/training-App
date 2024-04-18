import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/challenge/challengeinfo_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/challenge/custombuttonchallengedetail.dart';

class ChallengeInfoPage extends StatelessWidget {
  const ChallengeInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ChallengeInfoControllerImp());
    return GetBuilder<ChallengeInfoControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: controller.challengeInfoMap.isEmpty
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: AppColor.whiteColor,
                      strokeWidth: 2,
                    ),
                  )
                : Text('${controller.challengeInfoMap['Challenge_name']}'),
            backgroundColor: AppColor.primaryColor,
          ),
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: controller.challengeInfoExerciseList.length,
                    itemBuilder: (context, index) {
                      return CustomButtonChallengeDetail(
                        color: AppColor.primaryColor,
                        textTitle:
                            '${controller.challengeInfoExerciseList[index]['name']}\n',
                        textSubject:
                            '${controller.challengeInfoExerciseList[index]['description']}\n',
                        textDate:
                            'Date : ${controller.challengeInfoExerciseList[index]['date']}\n',
                        onPressed: () {
                          //controller.goToChallengeDetail(index + 1);
                          print('Challenge detail');
                        },
                      );
                    },
                  ),
                  Positioned(
                    width: 250,
                    bottom: 0,
                    right: 70,
                    child: CustomButtonAuth(
                      text: 'Enroll in the challenge',
                      color: AppColor.blueColor,
                      onPressed: () {
                        controller.goToEnrollChallenge();
                        print('enroll');
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
