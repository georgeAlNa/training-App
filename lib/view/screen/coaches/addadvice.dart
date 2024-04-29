import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/addadvice_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class AddAdvicePage extends StatelessWidget {
  const AddAdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    AddAdviceControllerImp controller = Get.put(AddAdviceControllerImp());
    Get.put(AddAdviceControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Advice'),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: AppColor.redColor,
            ),
            onPressed: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Sure Want Logout ?',
                onConfirm: () {
                  controller.logoutcoach();
                  Get.snackbar(
                    'Log Out',
                    'Logging out',
                  );
                  print('log out to coach');
                },
                onCancel: () {
                  Get.back();
                },
                cancelTextColor: AppColor.blackColor,
                confirmTextColor: AppColor.blackColor,
              );
            },
          )
        ],
      ),
      body: GetBuilder<AddAdviceControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hinttext: 'Enter Advice',
                    labeltext: 'Enter Advice',
                    iconData: Icons.numbers,
                    mycontroller: controller.message,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'username');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Trainer Id',
                    labeltext: 'Trainer Id',
                    iconData: Icons.numbers,
                    mycontroller: controller.trainerId,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomButtonAuth(
                    text: 'Add',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.addAdvice();
                    },
                  ),
                  CustomButtonAuth(
                    text: 'All Exercise Complete By UserId ',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      Get.toNamed(AppRoutes.allExerciseCompleteByUserId);
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
