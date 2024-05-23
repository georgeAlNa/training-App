import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToBuildMusclesController/getweekdetailsbuild_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/plans/custombuttonplandetails.dart';

class GetWeekDetailsBuildPage extends StatelessWidget {
  const GetWeekDetailsBuildPage({super.key});
  @override
  Widget build(BuildContext context) {
    GetWeekDetailBuildControllerImp controller1 =
        Get.put(GetWeekDetailBuildControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Week ${controller1.idOfWeek} ',
              style: const TextStyle(
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Text(
              'Details Build',
              style: TextStyle(
                color: AppColor.blackColor,
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.color,
        actions: [
          IconButton(
            onPressed: () {
              controller1.goToUpdateExercise();
            },
            icon: const Icon(
              Icons.update_outlined,
              color: AppColor.blackColor,
            ),
          ),
        ],
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
          GetBuilder<GetWeekDetailBuildControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: controller.getWeekDetailsList.length,
                    itemBuilder: (context, index) {
                      return CustomButtonPlanDetail(
                        color: AppColor.color,
                        textTitle:
                            '${controller.getWeekDetailsList[index]['name']}\n',
                        textId: '',
                        // Id : ${controller.getWeekDetailsList[index]['id']}\n
                        textSubject:
                            '${controller.getWeekDetailsList[index]['description']}\n',
                        textVideo: '\n',
                        // Video : ${controller.getWeekDetailsList[index]['video']}\n
                        textDate:
                            'Timer : ${controller.getWeekDetailsList[index]['date']} s',
                        onPressed: () {
                          controller.goToExerciseDetail(index);
                          print('Exercise Details');
                        },
                      );
                    },
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
