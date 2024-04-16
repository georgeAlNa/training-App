import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/exercisedetail_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';

// ignore: must_be_immutable
class ExerciseDetailPage extends StatelessWidget {
  bool active = true;
  ExerciseDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExerciseDetailControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Detail'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ExerciseDetailControllerImp>(
        builder: (controller) {
          return controller.exercisedetail.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(
                          text:
                              '${controller.exercisedetail[controller.idOfExercise]['name']}',
                        ),
                        CustomTextBodyAuth(
                          text:
                              '${controller.exercisedetail[controller.idOfExercise]['description']}',
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: GestureDetector(
                            child: Text(
                              '${controller.exercisedetail[controller.idOfExercise]['video']}',
                            ),
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 400,
                        ),
                        CustomButtomAuth(
                          color: AppColor.greenColor,
                          text: 'Add to Favorite',
                          onPressed: () {
                            controller.addExersiceToFavorite();
                            print('add to fav');
                          },
                        ),
                        CustomButtomAuth(
                          color: AppColor.greenColor,
                          text: 'Done',
                          onPressed: () {
                            controller.doneExercise();
                            print('Done Exercise');
                          },
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}