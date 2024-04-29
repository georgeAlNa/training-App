import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/allcategoryusercomplete_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/challenge/custombuttonchallengedetail.dart';

class AllCategoryAndExerciseCompletePage extends StatelessWidget {
  const AllCategoryAndExerciseCompletePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllCategoryAndExerciseCompleteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Exercise Complete'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AllCategoryAndExerciseCompleteControllerImp>(
        builder: (controller) {
          return controller.completeExerciseList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: controller.completeExerciseList.length,
                      itemBuilder: (context, index) {
                        return CustomButtonChallengeDetail(
                          textTitle:
                              'Name of Exercise: ${controller.completeExerciseList[index]['exercise_name']}',
                          color: AppColor.primaryColor,
                          textSubject: '',
                          //'is done : ${controller.completeExerciseList[index]['is_done']}',
                          textDate: '',
                          //'user id :${controller.completeExerciseList[index]['user_id']}',
                          onPressed: () {},
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
