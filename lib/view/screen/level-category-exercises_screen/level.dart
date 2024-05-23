import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/level_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Container2.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LevelControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: 5000,
              child: Image.asset(
                AppImageAsset.level,
                fit: BoxFit.fill,
              ),
            ),
            GetBuilder<LevelControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Choose Your Level\n',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColor.yellow100Color,
                          shadows: const [
                            Shadow(
                              blurRadius: 1,
                              offset: Offset(5, 5),
                              color: AppColor.blackColor,
                            ),
                            Shadow(
                              blurRadius: 60,
                              offset: Offset(5, 5),
                              color: AppColor.yellowColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.level.length,
                          itemBuilder: (context, index) {
                            return Container2(
                              title: '${controller.level[index]['level']}',
                              onTap: () {
                                controller.goToCategory(index + 1);
                                print('level');
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container2(
                        title: 'All Exercise Complete',
                        onTap: () {
                          controller.goToAllExerciseComplete();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
