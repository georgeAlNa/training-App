import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/level_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LevelControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Levels'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<LevelControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.level.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: '${controller.level[index]['level']}',
                    onPressed: () {
                      controller.goToCategory(index + 1);
                      print('level');
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
