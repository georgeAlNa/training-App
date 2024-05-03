import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/monthlyreportexercise_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class MonthlyReportExercisePage extends StatelessWidget {
  const MonthlyReportExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyReportExerciseControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Monthly Report Exercise'),
      ),
      body: GetBuilder<MonthlyReportExerciseControllerImp>(
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
                        CustomButtonAuth(
                          color: AppColor.primaryColor,
                          text: 'Submit',
                          onPressed: () {
                            controller.getMonthlyReportExercise();
                            print('month report');
                          },
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
                        textCurrentweight:
                            'exercise_id ${controller.monthlyReportExerciseList[index]['exercise_id']}',
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
        ),
      ),
    );
  }
}