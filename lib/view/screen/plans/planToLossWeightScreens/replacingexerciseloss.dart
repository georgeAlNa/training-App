import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToLossWeightController/replacingexerciseloss_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class ReplacingExerciseLossPage extends StatelessWidget {
  const ReplacingExerciseLossPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReplacingExerciseLossControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: const Text(
          'Replacing Exercise Loss',
        ),
      ),
      body: GetBuilder<ReplacingExerciseLossControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  const SizedBox(height: 25),
                  const CustomTextBodyAuth(
                    text:
                        'Exercise between 1 -> 5 in week 1 \n Exercise between 6 -> 10 in week 2 \n Exercise between 11 -> 15 in week 3 \n Exercise between 16 -> 20 in week 4 \n',
                  ),
                  const SizedBox(height: 35),
                  CustomTextFormAuth(
                    isNumber: true,
                    mycontroller: controller.planiId,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    hinttext: 'Week Number (1,2,3,4)',
                    labeltext: 'Week Number',
                    iconData: Icons.numbers_outlined,
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    mycontroller: controller.oldExerciseiId,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    hinttext: 'Old Exercise Id (Between 1 and 20)',
                    labeltext: 'Old Exercise Id',
                    iconData: Icons.numbers_outlined,
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    mycontroller: controller.newExerciseiId,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    hinttext: 'New Exercise Id (Between 1 and 20)',
                    labeltext: 'New Exercise Id',
                    iconData: Icons.numbers_outlined,
                  ),
                  CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: 'Replace',
                    onPressed: () {
                      controller.replaceExercise();
                      print('replace');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
