import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/dailyreportexercise_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class DailyReportExercisePage extends StatelessWidget {
  const DailyReportExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DailyReportExerciseControllerImp());
    return Scaffold1(
      title: 'Daily Report',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.report,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<DailyReportExerciseControllerImp>(
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
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return CustomReportProgress(
                              textTitle: 'Daily',
                              textCurrentweight:
                                  'Exercise Id : ${controller.dailyReportExerciseList[index]['exercise_id']}',
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
