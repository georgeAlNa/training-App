import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/dailyreportexercise_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class DailyReportExercisePage extends StatelessWidget {
  const DailyReportExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DailyReportExerciseControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Report Exercise'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<DailyReportExerciseControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: controller.dailyReportExerciseList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.dailyReportExerciseList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return CustomReportProgress(
                          textCurrentweight:
                              'exercise_id ${controller.dailyReportExerciseList[index]['exercise_id']}',
                          textAge: '',
                          textHeight: '',
                          textGender: '',
                          textTargetWeight: '',
                          textTimeToReachTheSpecifiedWeight: '',
                          textCalories: '',
                          color: AppColor.primaryColor,
                          onPressed: () {
                            controller.goToExerciseDetailReport(index);
                          },
                        );
                      }),
                    ),
            ),
          );
        },
      ),
    );
  }
}
