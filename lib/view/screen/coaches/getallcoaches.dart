import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/getallcoaches_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class AllCoachesPage extends StatelessWidget {
  const AllCoachesPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllCoachesControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Coaches Page'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AllCoachesControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.allCoachesList.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: '${controller.allCoachesList[index]['name']}',
                    onPressed: () {
                      controller.goToAdviceCreateByCoach(index + 1);
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
