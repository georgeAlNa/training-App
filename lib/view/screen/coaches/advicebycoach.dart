import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/advicebycoach_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class AdviceByCoachPage extends StatelessWidget {
  const AdviceByCoachPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AdviceByCoachControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advice By Coach Page'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AdviceByCoachControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.adviceByCoachList.length,
                itemBuilder: (context, index) {
                  return CustomButtomAuth(
                    color: AppColor.primaryColor,
                    text: '${controller.adviceByCoachList[index]['message']}',
                    onPressed: () {
                      //controller.goToAdviceCreateByCoach(index + 1);
                      print('advice');
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
