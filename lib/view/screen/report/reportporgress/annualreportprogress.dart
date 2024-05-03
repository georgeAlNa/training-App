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
                : ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.annualReportList.length,
                    itemBuilder: (context, index) => CustomReportProgress(
                      textCurrentweight:
                          'Current Weight ${controller.annualReportList[index]['Current_weight']}\n',
                      textAge:
                          'Age : ${controller.annualReportList[index]['age']}\n',
                      textHeight:
                          'Height : ${controller.annualReportList[index]['height']}\n',
                      textGender:
                          'Gender : ${controller.annualReportList[index]['gender']}\n',
                      textTargetWeight:
                          'Target Weight : ${controller.annualReportList[index]['Target_weight']}\n',
                      textTimeToReachTheSpecifiedWeight:
                          'Time To Reach The Specified Weight : ${controller.annualReportList[0]['Time_to_reach_the_specified_weight']}\n',
                      textCalories:
                          'Calories : ${controller.annualReportList[index]['Calories']} \n \n Created At : ${controller.annualReportList[index]['created_at']}\n',
                      color: AppColor.primaryColor,
                      onPressed: () {},
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
