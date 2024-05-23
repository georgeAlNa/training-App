import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportprogress/allreportprogress_controller.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Container2.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class AllReportProgressPage extends StatelessWidget {
  const AllReportProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    AllReportProgressControllerImp controller =
        Get.put(AllReportProgressControllerImp());
    return Scaffold1(
      title: 'Progress Report',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.challeng,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container2(
                  title: 'Daily Report',
                  onTap: () {
                    controller.goToDailyReport();
                    print('go To Daily Report');
                  },
                ),
                Container2(
                  title: 'Weekly Report',
                  onTap: () {
                    controller.goToWeeklyReport();
                    print('go To Weekly Report');
                  },
                ),
                Container2(
                  title: 'Monthly Report',
                  onTap: () {
                    controller.goToMonthlyReport();
                    print('go To Monthly Report');
                  },
                ),
                Container2(
                  title: 'Annual Report',
                  onTap: () {
                    controller.goToAnnualReport();
                    print('go To Annual Report');
                  },
                ),
                // Text('${controller.productId}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
