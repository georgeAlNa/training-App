import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToBuildMusclesController/getweekdetailsbuild_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/plans/custombuttonplandetails.dart';

class GetWeekDetailsBuildPage extends StatelessWidget {
  const GetWeekDetailsBuildPage({super.key});
  @override
  Widget build(BuildContext context) {
    GetWeekDetailBuildControllerImp controller1 =
        Get.put(GetWeekDetailBuildControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('Week ${controller1.idOfWeek} Details Build'),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              controller1.goToUpdateExercise();
            },
            icon: const Icon(Icons.update_outlined),
          ),
        ],
      ),
      body: GetBuilder<GetWeekDetailBuildControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.getWeekDetailsList.length,
                itemBuilder: (context, index) {
                  return CustomButtonPlanDetail(
                    color: AppColor.primaryColor,
                    textTitle:
                        'Name : ${controller.getWeekDetailsList[index]['name']}\n',
                    textId:
                        'Id : ${controller.getWeekDetailsList[index]['id']}\n',
                    textSubject:
                        'Description : ${controller.getWeekDetailsList[index]['description']}\n',
                    textVideo:
                        'Video : ${controller.getWeekDetailsList[index]['video']}\n',
                    textDate:
                        'Date : ${controller.getWeekDetailsList[index]['date']}',
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
    );
  }
}
