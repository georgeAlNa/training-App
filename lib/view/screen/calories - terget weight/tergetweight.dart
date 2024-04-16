import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/calories%20-%20terget%20weight/targetweight_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class TargetWeightPage extends StatelessWidget {
  const TargetWeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TargetWeightControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Target Weight'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<TargetWeightControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hinttext: 'Enter Your Target Weight',
                    labeltext: 'Target Weight',
                    iconData: Icons.numbers,
                    mycontroller: controller.targetWeight,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),

                  CustomButtomAuth(
                    text: 'Submit',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.targetWeightFun();
                    },
                  ),
                  // Text('${controller.token}'),
                  // Text('${controller.age}'),
                  // Text('${controller.currentWeight}'),
                  // Text('${controller.height}'),
                  // Text('${controller.gender}'),
                  //Text('${controller.targetWeight}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
