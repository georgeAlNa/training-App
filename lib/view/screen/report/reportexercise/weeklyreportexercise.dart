import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/weeklyreportexercise_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class WeeklyReportExercisePage extends StatelessWidget {
  const WeeklyReportExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WeeklyReportExerciseControllerImp());
    return Scaffold1(
      title: 'Weekly Report',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.report,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<WeeklyReportExerciseControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: controller.weeklyReportexerciseList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.weeklyReportexerciseList.length,
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return CustomReportProgress(
                              textTitle: 'Weekly',
                              textCurrentweight:
                                  'Exercise Id : ${controller.weeklyReportexerciseList[index]['exercise_id']}',
                              textAge: '',
                              textHeight: '',
                              textGender: '',
                              textTargetWeight: '',
                              textTimeToReachTheSpecifiedWeight: '',
                              textCalories: '',
                              textCreatedAt: '',
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
        ],
      ),
    );
  }
}
