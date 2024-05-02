import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportstore/allreportstore_controller.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class AllReportStorePage extends StatelessWidget {
  const AllReportStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    AllReportStoreControllerImp controller =
        Get.put(AllReportStoreControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Report Store Page',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(
          children: [
            CustomButtonAuth(
              color: AppColor.primaryColor,
              text: 'Daily Report',
              onPressed: () {
                controller.goToDailyReport();
                print('go To Daily Report');
              },
            ),
            CustomButtonAuth(
              color: AppColor.primaryColor,
              text: 'Weekly Report',
              onPressed: () {
                controller.goToWeeklyReport();
                print('go To Weekly Report');
              },
            ),
            CustomButtonAuth(
              color: AppColor.primaryColor,
              text: 'Monthly Report',
              onPressed: () {
                controller.goToMonthlyReport();
                print('go To Monthly Report');
              },
            ),
            CustomButtonAuth(
              color: AppColor.primaryColor,
              text: 'Annual Report',
              onPressed: () {
                controller.goToAnnualReport();
                print('go To Annual Report');
              },
            ),
            // Text('${controller.productId}'),
          ],
        ),
      ),
    );
  }
}
