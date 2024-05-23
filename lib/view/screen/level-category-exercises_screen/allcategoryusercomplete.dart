import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/allcategoryusercomplete_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Container2.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class AllCategoryAndExerciseCompletePage extends StatelessWidget {
  const AllCategoryAndExerciseCompletePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllCategoryAndExerciseCompleteControllerImp());
    return Scaffold1(
      title: 'All Exercise Complete',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.challeng,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<AllCategoryAndExerciseCompleteControllerImp>(
            builder: (controller) {
              return controller.completeExerciseList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.color,
                      ),
                    )
                  : HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: controller.completeExerciseList.length,
                          itemBuilder: (context, index) {
                            return Container2(
                              title:
                                  '${controller.completeExerciseList[index]['exercise_name']}',
                              //'is done : ${controller.completeExerciseList[index]['is_done']}',
                              //'user id :${controller.completeExerciseList[index]['user_id']}',
                              onTap: () {},
                            );
                          },
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
