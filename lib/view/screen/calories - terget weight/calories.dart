import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/calories%20-%20terget%20weight/calories_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class CaloriesPage extends StatelessWidget {
  const CaloriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CaloriesControllerImp());
    return Scaffold1(
      title: 'Add Your Information',
      // appBar: AppBar(
      //   title: const Text('Add Your Information'),
      //   backgroundColor: AppColor.primaryColor,
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: 5000,
            width: 5000,
            child: Image.asset(
              AppImageAsset.sport,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<CaloriesControllerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      CustomTextFormAuth(
                        hinttext: 'Enter Your Age',
                        labeltext: 'Age',
                        iconData: Icons.numbers,
                        mycontroller: controller.age,
                        valid: (value) {
                          return validInput(value!, 1, 100, 'number');
                        },
                        isNumber: true,
                      ),
                      CustomTextFormAuth(
                        hinttext: 'Enter Your Current Weight',
                        labeltext: 'Current Weight',
                        iconData: Icons.numbers,
                        mycontroller: controller.currentWeight,
                        valid: (value) {
                          return validInput(value!, 1, 100, 'number');
                        },
                        isNumber: true,
                      ),
                      CustomTextFormAuth(
                        hinttext:
                            'Enter Your Gender like this : man or feminine',
                        labeltext: 'Gender',
                        iconData: Icons.description,
                        mycontroller: controller.gender,
                        valid: (value) {
                          return validInput(value!, 1, 100, 'name');
                        },
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        hinttext: 'Enter Your Height',
                        labeltext: 'Height',
                        iconData: Icons.description,
                        mycontroller: controller.height,
                        valid: (value) {
                          return validInput(value!, 1, 100, 'number');
                        },
                        isNumber: true,
                      ),

                      CustomButtonAuth(
                        text: 'Add',
                        color: AppColor.color,
                        onPressed: () {
                          controller.goToSuccessSignup();
                        },
                      ),
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
