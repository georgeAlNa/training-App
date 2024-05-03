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
                  : ListView.builder(
                      itemCount: controller.weeklyReportList.length,
                      itemBuilder: (context, index) => CustomReportProgress(
                        textCurrentweight:
                            'Current Weight ${controller.weeklyReportList[index]['Current_weight']}\n',
                        textAge:
                            'Age : ${controller.weeklyReportList[index]['age']}\n',
                        textHeight:
                            'Height : ${controller.weeklyReportList[index]['height']}\n',
                        textGender:
                            'Gender : ${controller.weeklyReportList[index]['gender']}\n',
                        textTargetWeight:
                            'Target Weight : ${controller.weeklyReportList[index]['Target_weight']}\n',
                        textTimeToReachTheSpecifiedWeight:
                            'Time To Reach The Specified Weight : ${controller.weeklyReportList[0]['Time_to_reach_the_specified_weight']}\n',
                        textCalories:
                            'Calories : ${controller.weeklyReportList[index]['Calories']} \n \n Created At : ${controller.weeklyReportList[index]['created_at']}\n',
                        color: AppColor.primaryColor,
                        onPressed: () {},
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
