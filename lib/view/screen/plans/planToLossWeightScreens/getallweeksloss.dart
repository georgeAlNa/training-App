import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToLossWeightController/getallweeksloss_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class GetAllWeeksLossPage extends StatelessWidget {
  const GetAllWeeksLossPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetAllWeeksLossControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Weeks Loss'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<GetAllWeeksLossControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.allWeeksLossList.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: '${controller.allWeeksLossList[index]['name']}',
                    onPressed: () {
                      controller.goToWeekDetails(index + 1);
                      print('go To Week Details');
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
