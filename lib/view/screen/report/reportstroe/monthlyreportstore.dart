import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportstore/monthlyreportstore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class MonthlyReportStorePage extends StatelessWidget {
  const MonthlyReportStorePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyReportStoreControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Monthly Report Store'),
      ),
      body: GetBuilder<MonthlyReportStoreControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: controller.monthlyReportStoreList.isEmpty
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
                            controller.getMonthlyReportStore();
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
                              'Product Id ${controller.monthlyReportStoreList[0]['product_id']}',
                          textAge:
                              'Order Id : ${controller.monthlyReportStoreList[0]['order_id']}',
                          textHeight:
                              'Amount : ${controller.monthlyReportStoreList[0]['amount']}',
                          textGender:
                              'Payment : ${controller.monthlyReportStoreList[0]['Payment']}',
                          textTargetWeight: '',
                          textTimeToReachTheSpecifiedWeight: '',
                          textCalories: '',
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
