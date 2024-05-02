import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportprogress/annualreportprogress_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class AnnualReportProgressPage extends StatelessWidget {
  const AnnualReportProgressPage({super.key});
  // dynamic vertificate;

  @override
  Widget build(BuildContext context) {
    Get.put(AnnualReportProgressControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Annual Report Progress'),
      ),
      body: GetBuilder<AnnualReportProgressControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: controller.annualReportList.isEmpty
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
                            controller.getAnnualReport();
                            print('Year report');
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
                            'Current Weight ${controller.annualReportList[0]['Current_weight']}',
                        textAge:
                            'Age : ${controller.annualReportList[0]['age']}',
                        textHeight:
                            'Height : ${controller.annualReportList[0]['height']}',
                        textGender:
                            'Gender : ${controller.annualReportList[0]['gender']}',
                        textTargetWeight:
                            'Target Weight : ${controller.annualReportList[0]['Target_weight']}',
                        textTimeToReachTheSpecifiedWeight:
                            'Time To Reach The Specified Weight : ${controller.annualReportList[0]['Time_to_reach_the_specified_weight']}',
                        textCalories:
                            'Calories : ${controller.annualReportList[0]['Calories']}',
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
