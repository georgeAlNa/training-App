import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToBuildMusclesController/getweekdetailsbuild_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/plans/custombuttonplandetails.dart';

class GetWeekDetailsBuildPage extends StatelessWidget {
  const GetWeekDetailsBuildPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetWeekDetailBuildControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week Details'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<GetWeekDetailBuildControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.getWeekDetailsList.length,
                itemBuilder: (context, index) {
                  return CustomButtonPlanDetail(
                    color: AppColor.primaryColor,
                    textTitle:
                        '${controller.getWeekDetailsList[index]['name']}\n',
                    textSubject:
                        '${controller.getWeekDetailsList[index]['description']}\n',
                    textVideo:
                        '${controller.getWeekDetailsList[index]['video']}\n',
                    textDate: '${controller.getWeekDetailsList[index]['date']}',
                    onPressed: () {
                      //controller.goToWeekDetails(index + 1);
                      print('Week Details');
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
