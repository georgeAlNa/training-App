import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/auth/verifycode_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeConrollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '39'.tr,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<VerifyCodeConrollerImp>(
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
                    text: '40'.tr,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextBodyAuth(
                    text: 'Please Enter Code That Received in ${controller.email}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    mycontroller: controller.verify,
                    valid: (value) {
                      return validInput(value!, 1, 4, 'number');
                    },
                    hinttext: 'Code',
                    labeltext: 'Enter Code',
                    iconData: Icons.code_off_outlined,
                  ),
                  CustomButtomAuth(
                    color: AppColor.primaryColor,
                    text: '42'.tr,
                    onPressed: () {
                      controller.verifyCode();
                      print('verified ');
                    },
                  ),
                  //Text('${controller.email}'),

                  // OtpTextField(
                  //   numberOfFields: 5,
                  //   fieldWidth: 50,
                  //   borderRadius: BorderRadius.circular(20),
                  //   focusedBorderColor: AppColor.primaryColor,
                  //   showFieldAsBox: true,
                  //   borderWidth: 4.0,
                  //   //runs when a code is typed in
                  //   onCodeChanged: (String code) {
                  //     //handle validation or checks here if necessary
                  //   },
                  //   //runs when every textfield is filled
                  //   onSubmit: (String verificationCode) {
                  //     controller.verifyCode(verificationCode);
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
