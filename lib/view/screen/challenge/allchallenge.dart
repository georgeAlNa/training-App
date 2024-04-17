import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/challenge/allchallenge_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class AllChallengePage extends StatelessWidget {
  const AllChallengePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllChallengeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AllChallengeControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.allChallengeList.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text:
                        '${controller.allChallengeList[index]['Challenge_name']}',
                    onPressed: () {
                      controller.goToChallengeDetail(index + 1);
                      print('Challenge');
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
