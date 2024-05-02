import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportprogress/weeklyreportprogress_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class WeeklyReportProgressPage extends StatelessWidget {
  const WeeklyReportProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WeeklyReportProgressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Report Progress'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<WeeklyReportProgressControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: controller.weeklyReportList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: [
                        CustomReportProgress(
                          textCurrentweight:
                              'Current Weight ${controller.weeklyReportList[0]['Current_weight']}',
                          textAge:
                              'Age : ${controller.weeklyReportList[0]['age']}',
                          textHeight:
                              'Height : ${controller.weeklyReportList[0]['height']}',
                          textGender:
                              'Gender : ${controller.weeklyReportList[0]['gender']}',
                          textTargetWeight:
                              'Target Weight : ${controller.weeklyReportList[0]['Target_weight']}',
                          textTimeToReachTheSpecifiedWeight:
                              'Time To Reach The Specified Weight : ${controller.weeklyReportList[0]['Time_to_reach_the_specified_weight']}',
                          textCalories:
                              'Calories : ${controller.weeklyReportList[0]['Calories']}',
                          color: AppColor.primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
