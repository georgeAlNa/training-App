import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/annualreportexercise_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class AnnualReportExercisePage extends StatelessWidget {
  const AnnualReportExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AnnualReportExerciseControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Annual Report Exercise'),
      ),
      body: GetBuilder<AnnualReportExerciseControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: controller.annualReportExerciseList.isEmpty
                ? Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextFormAuth(
                          isNumber: true,
                          mycontroller: controller.year,
                          valid: (value) {
                            return validInput(value!, 1, 4, 'number');
                          },
                          hinttext: 'Year',
                          labeltext: 'Enter Year Number',
                          iconData: Icons.numbers_outlined,
                        ),
                        CustomButtonAuth(
                          color: AppColor.primaryColor,
                          text: 'Submit',
                          onPressed: () {
                            controller.getAnnualReportExercise();
                            print('Year report');
                          },
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.annualReportExerciseList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return CustomReportProgress(
                        textCurrentweight:
                            'exercise_id ${controller.annualReportExerciseList[index]['exercise_id']}',
                        textAge: '',
                        textHeight: '',
                        textGender: '',
                        textTargetWeight: '',
                        textTimeToReachTheSpecifiedWeight: '',
                        textCalories: '',
                        color: AppColor.primaryColor,
                        onPressed: () {},
                      );
                    }),
                  ),
          ),
        ),
      ),
    );
  }
}
