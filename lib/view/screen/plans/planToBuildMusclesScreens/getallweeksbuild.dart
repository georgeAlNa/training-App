import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToBuildMusclesController/getallweeksbuild_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class GetAllWeeksBuildPage extends StatelessWidget {
  const GetAllWeeksBuildPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetAllWeeksBuildControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Weeks Build'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<GetAllWeeksBuildControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.allWeeksList.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: '${controller.allWeeksList[index]['name']}',
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
