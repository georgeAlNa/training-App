import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportstore/dailyreportstore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class DailyReportStorePage extends StatelessWidget {
  const DailyReportStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DailyReportStoreControllerImp());
    return Scaffold1(
      title: 'Daily Report',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.report,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<DailyReportStoreControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: controller.dailyReportStoreList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.dailyReportStoreList.length,
                          itemBuilder: (context, index) => CustomReportProgress(
                            textTitle: 'Daily',
                            textCurrentweight:
                                'Product Id ${controller.dailyReportStoreList[index]['product_id']}\n',
                            textAge:
                                'Order Id : ${controller.dailyReportStoreList[index]['order_id']}\n',
                            textHeight:
                                'Amount : ${controller.dailyReportStoreList[index]['amount']}\n',
                            textGender:
                                'Payment : ${controller.dailyReportStoreList[index]['Payment']}\n',
                            textCreatedAt:
                                'Created At : ${controller.dailyReportStoreList[index]['created_at']}\n',
                            textTimeToReachTheSpecifiedWeight: '',
                            textCalories: '',
                            textTargetWeight: '',
                            color: AppColor.primaryColor,
                            onPressed: () {},
                          ),
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
