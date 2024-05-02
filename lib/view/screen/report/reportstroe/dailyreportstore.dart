import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportstore/dailyreportstore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class DailyReportStorePage extends StatelessWidget {
  const DailyReportStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DailyReportStoreControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Report Store'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<DailyReportStoreControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: controller.dailyReportStoreList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: [
                        CustomReportProgress(
                          textCurrentweight:
                              'Product Id ${controller.dailyReportStoreList[0]['product_id']}',
                          textAge:
                              'Order Id : ${controller.dailyReportStoreList[0]['order_id']}',
                          textHeight:
                              'Amount : ${controller.dailyReportStoreList[0]['amount']}',
                          textGender:
                              'Payment : ${controller.dailyReportStoreList[0]['Payment']}',
                          textTargetWeight: '',
                          textTimeToReachTheSpecifiedWeight: '',
                          textCalories: '',
                          color: AppColor.primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
