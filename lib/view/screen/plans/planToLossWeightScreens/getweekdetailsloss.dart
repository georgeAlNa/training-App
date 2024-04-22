import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToLossWeightController/getweekdetailsloss_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/plans/custombuttonplandetails.dart';

class GetWeekDetailsLossPage extends StatelessWidget {
  const GetWeekDetailsLossPage({super.key});
  @override
  Widget build(BuildContext context) {
    GetWeekDetailLossControllerImp controller1 =
        Get.put(GetWeekDetailLossControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('Week ${controller1.idOfWeek} Details Loss'),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              controller1.goToUpdateExercise();
            },
            icon: const Icon(Icons.update_outlined),
          ),
        ],
      ),
      body: GetBuilder<GetWeekDetailLossControllerImp>(
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
                        'Name : ${controller.getWeekDetailsList[index]['name']}\n',
                    textId:
                        'Id : ${controller.getWeekDetailsList[index]['id']}\n',
                    textSubject:
                        'Description : ${controller.getWeekDetailsList[index]['description']}\n',
                    textVideo:
                        'Video : ${controller.getWeekDetailsList[index]['video']}\n',
                    textDate:
                        'Date : ${controller.getWeekDetailsList[index]['date']}',
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
