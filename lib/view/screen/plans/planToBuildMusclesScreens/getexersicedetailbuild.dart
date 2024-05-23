import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToBuildMusclesController/getexersicedetailbuild_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ExerciseDetailBuildPage extends StatelessWidget {
  bool active = true;
  ExerciseDetailBuildPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetExercieDetailBuildControllerImp());
    return Scaffold1(
      title: 'Exercise Detail',
      // appBar: AppBar(
      //   title: const Text(
      //     'Exercise Detail',
      //   ),
      //   backgroundColor: AppColor.primaryColor,
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: 5000,
            child: Image.asset(
              AppImageAsset.exercise,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<GetExercieDetailBuildControllerImp>(
            builder: (controller) {
              return controller.getExerciseDetailsList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColor.color,
                    ))
                  : HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextTitleAuth(
                              text:
                                  '${controller.getExerciseDetailsList[controller.idOfExercise]['name']}\n',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextBodyAuth(
                              text:
                                  '${controller.getExerciseDetailsList[controller.idOfExercise]['description']}\n',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // CustomTextBodyAuth(
                            //   text:
                            //       'id : ${controller.getExerciseDetailsList[controller.idOfExercise]['id']}\n',
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Show On Youtube  : ',
                                  style: TextStyle(
                                    color: AppColor.yellow100Color,
                                    fontSize: 18,
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
                                        '${controller.getExerciseDetailsList[controller.idOfExercise]['video']}\n',
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(20),
                            //   child: GestureDetector(
                            //     child: Text(
                            //       '${controller.getExerciseDetailsList[controller.idOfExercise]['video']}\n',
                            //     ),
                            //     onTap: () {},
                            //   ),
                            // ),
                            Center(
                              child: Text(
                                'Timer : ${controller.timeLeft}',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.yellow100Color,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 100,
                            ),

                            CustomButtonAuth(
                              color: AppColor.yellow100Color,
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
        ],
      ),
    );
  }
}
