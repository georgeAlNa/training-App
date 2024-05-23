import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/auth/resetpassword_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/container/customappbarauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordConrollerImp());
    return CustomAppBarAuth(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: Text(
      //     '47'.tr,
      //     style: const TextStyle(
      //       color: Colors.grey,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      title: '47'.tr,
      body: Stack(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              AppImageAsset.auth,
              fit: BoxFit.fill,
            ),
          ),
          ListView(
            reverse: true,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  color: AppColor.blackColor,
                ),
                height: 500,
                child: GetBuilder<ResetPasswordConrollerImp>(
                  builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 35),
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
                              iconData: controller.isShowwPassword
                                  ? Icons.remove_red_eye
                                  : Icons.panorama_fish_eye_sharp,
                            ),
                            CustomButtonAuth(
                              color: AppColor.color,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
