import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportprogress/dailyreportprogress_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class DailyReportProgressPage extends StatelessWidget {
  const DailyReportProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DailyReportProgressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Report Progress'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<DailyReportProgressControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: controller.dailyReportList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: [
                        CustomReportProgress(
                          textCurrentweight:
                              'Current Weight ${controller.dailyReportList[0]['Current_weight']}',
                          textAge:
                              'Age : ${controller.dailyReportList[0]['age']}',
                          textHeight:
                              'Height : ${controller.dailyReportList[0]['height']}',
                          textGender:
                              'Gender : ${controller.dailyReportList[0]['gender']}',
                          textTargetWeight:
                              'Target Weight : ${controller.dailyReportList[0]['Target_weight']}',
                          textTimeToReachTheSpecifiedWeight:
                              'Time To Reach The Specified Weight : ${controller.dailyReportList[0]['Time_to_reach_the_specified_weight']}',
                          textCalories:
                              'Calories : ${controller.dailyReportList[0]['Calories']}',
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
