import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/exercisedetail_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ExerciseDetailPage extends StatelessWidget {
  bool active = true;
  ExerciseDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExerciseDetailControllerImp()
        // ,permanent: true
        );
    return Scaffold1(
      title: 'Exercise Detail',
      // appBar: AppBar(
      //   title: const Text('Exercise Detail'),
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
          GetBuilder<ExerciseDetailControllerImp>(
            builder: (controller) {
              return controller.exercisedetail.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.color,
                      ),
                    )
                  : HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextTitleAuth(
                              text:
                                  '${controller.exercisedetail[controller.idOfExercise]['name']}',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextBodyAuth(
                              text:
                                  '${controller.exercisedetail[controller.idOfExercise]['description']}',
                            ),
                            // CustomTextBodyAuth(
                            //   text:
                            //       'id : ${controller.exercisedetail[controller.idOfExercise]['id']}',
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(20),
                            //   color: AppColor.greyColor,
                            //   child: GestureDetector(
                            //     child: Text(
                            //       '${controller.exercisedetail[controller.idOfExercise]['video']}',
                            //     ),
                            //     onTap: () async {
                            //       await launchUrl(
                            //         Uri.parse(
                            //           '${controller.exercisedetail[controller.idOfExercise]['video']}',
                            //         ),
                            //       );
                            //     },
                            //   ),
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
                                        '${controller.exercisedetail[controller.idOfExercise]['video']}',
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                'Timer : ${controller.timeLeft} s',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomButtonAuth(
                                  color: AppColor.yellow100Color,
                                  text: 'Start',
                                  onPressed: () {
                                    controller.startTimerCountDown();
                                    print('Start Exercise');
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.addExersiceToFavorite();
                                    print('add to fav');
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: controller.colorOfFavorite
                                        ? AppColor.redColor
                                        : AppColor.whiteColor,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            // CustomButtonAuth(
                            //   color: AppColor.red2Color,
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
