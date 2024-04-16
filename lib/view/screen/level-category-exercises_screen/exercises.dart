import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/exercises_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExerciseControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ExerciseControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.exercise.length,
                itemBuilder: (context, index) {
                  return CustomButtomAuth(
                    color: AppColor.primaryColor,
                    text: '${controller.exercise[index]['name']}',
                    onPressed: () {
                      controller.goToExercisesDetail(index);
                      print('Exercises');
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
