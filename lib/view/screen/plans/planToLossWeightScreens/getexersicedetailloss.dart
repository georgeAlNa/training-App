import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToLossWeightController/getexersicedetailloss_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';

// ignore: must_be_immutable
class ExerciseDetailLossPage extends StatelessWidget {
  bool active = true;
  ExerciseDetailLossPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetExercieDetailLossControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Detail'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<GetExercieDetailLossControllerImp>(
        builder: (controller) {
          return controller.getExerciseDetailsList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(
                          text:
                              '${controller.getExerciseDetailsList[controller.idOfExercise]['name']}\n',
                        ),
                        CustomTextBodyAuth(
                          text:
                              '${controller.getExerciseDetailsList[controller.idOfExercise]['description']}\n',
                        ),
                        CustomTextBodyAuth(
                          text:
                              'id : ${controller.getExerciseDetailsList[controller.idOfExercise]['id']}\n',
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: GestureDetector(
                            child: Text(
                              '${controller.getExerciseDetailsList[controller.idOfExercise]['video']}\n',
                            ),
                            onTap: () {},
                          ),
                        ),
                        Center(
                          child: Text(
                            '${controller.timeLeft}',
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 300,
                        ),
                        CustomButtonAuth(
                          color: AppColor.greenColor,
                          text: 'Start',
                          onPressed: () {
                            controller.startTimerCountDown();
                            print('Start Exercise');
                          },
                        ),
                        // CustomButtonAuth(
                        //   color: AppColor.greenColor,
                        //   text: 'Add to Favorite',
                        //   onPressed: () {
                        //     controller.addExersiceToFavorite();
                        //     print('add to fav');
                        //   },
                        // ),

                        // CustomButtonAuth(
                        //   color: AppColor.greenColor,
                        //   text: 'Done',
                        //   onPressed: () {
                        //     controller.doneExercise();
                        //     print('Done Exercise');
                        //   },
                        // ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
