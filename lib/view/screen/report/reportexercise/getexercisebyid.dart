import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/getexercisebyid_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class GetExerciseByIdReportPage extends StatelessWidget {
  const GetExerciseByIdReportPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetExerciseByIdReportControllerImp());
    return Scaffold1(
      title: 'Exercise Detail By Id',
      // appBar: AppBar(
      //   title: const Text(
      //     'Exercise Detail By Id',
      //   ),
      //   backgroundColor: AppColor.primaryColor,
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: 5000,
            child: Image.asset(
              AppImageAsset.challeng,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<GetExerciseByIdReportControllerImp>(
            builder: (controller) {
              return controller.exerciseByIdReportList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.color,
                      ),
                    )
                  : HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextTitleAuth(
                              text:
                                  '${controller.exerciseByIdReportList[0]['name']}\n',
                            ),
                            CustomTextBodyAuth(
                              text:
                                  '${controller.exerciseByIdReportList[0]['description']}\n',
                            ),
                            CustomTextBodyAuth(
                              text:
                                  'Id : ${controller.exerciseByIdReportList[0]['id']}\n',
                            ),
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
                                        '${controller.exerciseByIdReportList[0]['video']}',
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            CustomTextBodyAuth(
                              text:
                                  'Timer : ${controller.exerciseByIdReportList[0]['date']}\n',
                            ),
                            const SizedBox(
                              height: 300,
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(20),
                            //   color: AppColor.greyColor,
                            //   child: GestureDetector(
                            //     child: Text(
                            //       '${controller.exerciseByIdReportList[0]['video']}',
                            //     ),
                            //     onTap: () async {
                            //       await launchUrl(
                            //         Uri.parse(
                            //           '${controller.exerciseByIdReportList[0]['video']}',
                            //         ),
                            //       );
                            //     },
                            //   ),
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
