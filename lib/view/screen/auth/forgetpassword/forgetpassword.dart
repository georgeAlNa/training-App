import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/auth/forgetpassword_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordConrollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '44'.tr,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<ForgetPasswordConrollerImp>(
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
                    text: '12'.tr,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, 'email');
                    },
                    mycontroller: controller.email,
                    hinttext: '12'.tr,
                    labeltext: '18'.tr,
                    iconData: Icons.email_outlined,
                  ),
                  CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: '30'.tr,
                    onPressed: () {
                      controller.forgetPass();
                      print('forget ');
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
