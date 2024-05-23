import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/monthlyreportexercise_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class MonthlyReportExercisePage extends StatelessWidget {
  const MonthlyReportExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyReportExerciseControllerImp());
    return Scaffold1(
      title: 'Monthly Report',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.report,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<MonthlyReportExerciseControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: controller.monthlyReportExerciseList.isEmpty
                    ? Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            CustomTextFormAuth(
                              isNumber: true,
                              mycontroller: controller.month,
                              valid: (value) {
                                return validInput(value!, 1, 2, 'number');
                              },
                              hinttext: 'Month',
                              labeltext: 'Enter Month Number',
                              iconData: Icons.numbers_outlined,
                            ),
                            // CustomButtonAuth(
                            //   color: AppColor.color,
                            //   text: 'Submit',
                            //   onPressed: () {
                            //     controller.getMonthlyReportExercise();
                            //     print('month report');
                            //   },
                            // ),
                            IconButton(
                              onPressed: () {
                                controller.getMonthlyReportExercise();
                              },
                              icon: const Icon(
                                Icons.search,
                                color: AppColor.color,
                                size: 80,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.monthlyReportExerciseList.length,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return CustomReportProgress(
                            textTitle: 'Monthly',
                            textCurrentweight:
                                'Exercise Id : ${controller.monthlyReportExerciseList[index]['exercise_id']}',
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
            ),
          ),
        ],
      ),
    );
  }
}
