import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportstore/annualreportstore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class AnnualReportStorePage extends StatelessWidget {
  const AnnualReportStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AnnualReportStoreControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Annual Report Store'),
      ),
      body: GetBuilder<AnnualReportStoreControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: controller.annualReportStoreList.isEmpty
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
                            controller.getAnnualReportStore();
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
                            'Product Id ${controller.annualReportStoreList[0]['product_id']}',
                        textAge:
                            'Order Id : ${controller.annualReportStoreList[0]['order_id']}',
                        textHeight:
                            'Amount : ${controller.annualReportStoreList[0]['amount']}',
                        textGender:
                            'Payment : ${controller.annualReportStoreList[0]['Payment']}',
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
