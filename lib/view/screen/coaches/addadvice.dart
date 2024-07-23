import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/addadvice_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/container/appbarforcoach.dart';

class AddAdvicePage extends StatelessWidget {
  const AddAdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    AddAdviceControllerImp controller = Get.put(AddAdviceControllerImp());
    Get.put(AddAdviceControllerImp());
    return AppBarCoach(
      title: 'Add Advice',
      onPressedIconRefresh: () => controller.refreshPage(),
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

      // appBar: AppBar(
      //   title: const Text('Add Advice'),
      //   backgroundColor: AppColor.primaryColor,
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.logout,
      //         color: AppColor.redColor,
      //       ),
      //       onPressed: () {
      //         Get.defaultDialog(
      //           title: 'Logout',
      //           middleText: 'Sure Want Logout ?',
      //           onConfirm: () {
      //             controller.logoutcoach();
      //             Get.snackbar(
      //               'Log Out',
      //               'Logging out',
      //             );
      //             print('log out to coach');
      //           },
      //           onCancel: () {
      //             Get.back();
      //           },
      //           cancelTextColor: AppColor.blackColor,
      //           confirmTextColor: AppColor.blackColor,
      //         );
      //       },
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: 5000,
            width: 5000,
            child: Image.asset(
              AppImageAsset.exercise,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<AddAdviceControllerImp>(
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
                          return validInput(value!, 1, 100, 'message');
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
                        color: AppColor.color,
                        onPressed: () {
                          controller.addAdvice();
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // CustomButtonAuth(
                      //   text: 'All Exercise Complete By UserId ',
                      //   color: AppColor.color,
                      //   onPressed: () {
                      //     Get.toNamed(AppRoutes.allExerciseCompleteByUserId);
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 50,
                      // ),
                      // CustomButtonAuth(
                      //   text: 'All Request For Advice',
                      //   color: AppColor.color,
                      //   onPressed: () {
                      //     Get.toNamed(AppRoutes.allAdviceRequestByCoach);
                      //   },
                      // ),
                      //Text('${controller.token}'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
