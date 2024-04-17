import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/addchallenge_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class AddChallengePage extends StatelessWidget {
  const AddChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddChallengeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Challenge'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AddChallengeControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hinttext: 'Challenge Name',
                    labeltext: 'Challenge Name',
                    iconData: Icons.description,
                    mycontroller: controller.challengeName,
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
                    hinttext: 'End At',
                    labeltext: 'End At',
                    iconData: Icons.numbers,
                    mycontroller: controller.endAt,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids one',
                    labeltext: 'Exercise ids one',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids1,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids tow',
                    labeltext: 'Exercise ids tow',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids2,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids three',
                    labeltext: 'Exercise ids three',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids3,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids four',
                    labeltext: 'Exercise ids four',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids4,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids five',
                    labeltext: 'Exercise ids five',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids5,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids six',
                    labeltext: 'Exercise ids six',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids6,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids seven',
                    labeltext: 'Exercise ids seven',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids7,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids Eight',
                    labeltext: 'Exercise ids Eight',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids8,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids nine',
                    labeltext: 'Exercise ids nine',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids9,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Exercise ids ten',
                    labeltext: 'Exercise ids ten',
                    iconData: Icons.numbers,
                    mycontroller: controller.exerciseids10,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomButtonAuth(
                    text: 'Add',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.challenge();
                    },
                  ),
                  // Text('${controller.token}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
