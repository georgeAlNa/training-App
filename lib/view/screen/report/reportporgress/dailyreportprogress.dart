import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportprogress/dailyreportprogress_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/report/customreportprogress.dart';

class DailyReportProgressPage extends StatelessWidget {
  const DailyReportProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DailyReportProgressControllerImp());
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
          GetBuilder<DailyReportProgressControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: controller.dailyReportList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.dailyReportList.length,
                          itemBuilder: (context, index) => CustomReportProgress(
                            textTitle: 'Daily',
                            textCurrentweight:
                                'Current Weight ${controller.dailyReportList[index]['Current_weight']}\n',
                            textAge:
                                'Age : ${controller.dailyReportList[index]['age']}\n',
                            textHeight:
                                'Height : ${controller.dailyReportList[index]['height']}\n',
                            textGender:
                                'Gender : ${controller.dailyReportList[index]['gender']}\n',
                            textTargetWeight:
                                'Target Weight : ${controller.dailyReportList[index]['Target_weight']}\n',
                            textTimeToReachTheSpecifiedWeight:
                                'Time To Reach The Specified Weight : ${controller.dailyReportList[0]['Time_to_reach_the_specified_weight']}\n',
                            textCalories:
                                'Calories : ${controller.dailyReportList[index]['Calories']} \n',
                            textCreatedAt:
                                'Created At : ${controller.dailyReportList[index]['created_at']}\n',
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
// \n \n 