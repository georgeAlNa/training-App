import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/auth/resetpassword_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordConrollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '47'.tr,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<ResetPasswordConrollerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  //const SizedBox(height: 20),
                  CustomTextTitleAuth(
                    text: '35'.tr,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextBodyAuth(
                    text: '34'.tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormAuth(
                    obscureText: controller.isShowwPassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, 'password');
                    },
                    mycontroller: controller.password,
                    hinttext: '13'.tr,
                    labeltext: '19'.tr,
                    iconData: Icons.lock_clock_outlined,
                  ),
                  CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: '33'.tr,
                    onPressed: () {
                      controller.resetPass();
                      print('Submit ');
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
