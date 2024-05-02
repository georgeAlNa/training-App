import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportprogress/monthlyreportprogress_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class MonthlyReportProgressPage extends StatelessWidget {
  const MonthlyReportProgressPage({super.key});
  // dynamic vertificate;

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyReportProgressControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Monthly Report Progress'),
      ),
      body: GetBuilder<MonthlyReportProgressControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: controller.monthlyReportList.isEmpty
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
                            controller.getMonthlyReport();
                            print('month report');
                          },
                        ),
                      ],
                    ),
                  )
                : ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      CustomReportProgress(
                        textCurrentweight:
                            'Current Weight ${controller.monthlyReportList[0]['Current_weight']}',
                        textAge:
                            'Age : ${controller.monthlyReportList[0]['age']}',
                        textHeight:
                            'Height : ${controller.monthlyReportList[0]['height']}',
                        textGender:
                            'Gender : ${controller.monthlyReportList[0]['gender']}',
                        textTargetWeight:
                            'Target Weight : ${controller.monthlyReportList[0]['Target_weight']}',
                        textTimeToReachTheSpecifiedWeight:
                            'Time To Reach The Specified Weight : ${controller.monthlyReportList[0]['Time_to_reach_the_specified_weight']}',
                        textCalories:
                            'Calories : ${controller.monthlyReportList[0]['Calories']}',
                        color: AppColor.primaryColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
