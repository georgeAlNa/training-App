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
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.annualReportStoreList.length,
                    itemBuilder: (context, index) => CustomReportProgress(
                      textCurrentweight:
                          'Product Id ${controller.annualReportStoreList[index]['product_id']}\n',
                      textAge:
                          'Order Id : ${controller.annualReportStoreList[index]['order_id']}\n',
                      textHeight:
                          'Amount : ${controller.annualReportStoreList[index]['amount']}\n',
                      textGender:
                          'Payment : ${controller.annualReportStoreList[index]['Payment']}\n',
                      textTargetWeight:
                          'Created At : ${controller.annualReportStoreList[index]['created_at']}\n',
                      textTimeToReachTheSpecifiedWeight: '',
                      textCalories: '',
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