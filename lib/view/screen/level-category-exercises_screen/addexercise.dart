import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/addexercise_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class AddExercisePage extends StatelessWidget {
  const AddExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddExerciseControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AddExerciseControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hinttext: 'Level Id',
                    labeltext: 'Level Id',
                    iconData: Icons.numbers,
                    mycontroller: controller.levelId,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Category Id',
                    labeltext: 'Category Id',
                    iconData: Icons.numbers,
                    mycontroller: controller.categoryId,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise Name',
                    labeltext: 'Exercise Name',
                    iconData: Icons.description,
                    mycontroller: controller.name,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'username');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Description',
                    labeltext: 'Description',
                    iconData: Icons.description,
                    mycontroller: controller.description,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'username');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Date',
                    labeltext: 'Date',
                    iconData: Icons.date_range,
                    mycontroller: controller.date,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Video',
                    labeltext: 'Video',
                    iconData: Icons.camera,
                    mycontroller: controller.video,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'username');
                    },
                    isNumber: false,
                  ),
                  CustomButtonAuth(
                    text: 'Add',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.exercise();
                    },
                  ),
                  //Text('${controller.token}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
