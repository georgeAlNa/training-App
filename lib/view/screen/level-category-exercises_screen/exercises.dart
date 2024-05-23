import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/exercises_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Container2.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExerciseControllerImp());
    return Scaffold1(
      title: 'Exercises',
      body: Stack(
        children: [
          SizedBox(
            height: 5000,
            child: Image.asset(
              AppImageAsset.exercise,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<ExerciseControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(1),
                  child: ListView.builder(
                    itemCount: controller.exercise.length,
                    itemBuilder: (context, index) {
                      return Container2(
                        title: '${controller.exercise[index]['name']}',
                        onTap: () {
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
        ],
      ),
    );
  }
}
