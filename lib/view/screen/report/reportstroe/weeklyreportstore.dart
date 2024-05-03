import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportstore/weeklyreportstore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class WeeklyReportStorePage extends StatelessWidget {
  const WeeklyReportStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WeeklyReportStoreControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Report Store'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<WeeklyReportStoreControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: controller.weeklyReportStoreList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.weeklyReportStoreList.length,
                      itemBuilder: (context, index) => CustomReportProgress(
                        textCurrentweight:
                            'Product Id ${controller.weeklyReportStoreList[index]['product_id']}\n',
                        textAge:
                            'Order Id : ${controller.weeklyReportStoreList[index]['order_id']}\n',
                        textHeight:
                            'Amount : ${controller.weeklyReportStoreList[index]['amount']}\n',
                        textGender:
                            'Payment : ${controller.weeklyReportStoreList[index]['Payment']}\n',
                        textTargetWeight:
                            'Created At : ${controller.weeklyReportStoreList[index]['created_at']}\n',
                        textTimeToReachTheSpecifiedWeight: '',
                        textCalories: '',
                        color: AppColor.primaryColor,
                        onPressed: () {},
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
