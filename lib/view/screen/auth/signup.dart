import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/auth/signup_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/alertdialog.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/auth/textsignup.dart';
import 'package:training_app/view/widget/container/customappbarauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());

    return CustomAppBarAuth(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: Text(
      //     '17'.tr,
      //     style: const TextStyle(
      //       color: Colors.grey,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      title: '17'.tr,
      body: WillPopScope(
        onWillPop: alertDialog,
        child:
            // GetBuilder<SignupControllerImp>(
            //   builder: (controller) => controller.statusRequest ==
            //           StatusRequest.loading
            //       ? Center(
            //           child: CircularProgressIndicator(),
            //         )
            Stack(
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
                  child: GetBuilder<SignupControllerImp>(
                    builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              const SizedBox(height: 20),
                              CustomTextTitleAuth(text: '10'.tr),
                              const SizedBox(height: 45),
                              const CustomTextBodyAuth(
                                text: 'Sign Up With Your Email And Password',
                              ),
                              const SizedBox(height: 60),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 2, 10, 'username');
                                },
                                mycontroller: controller.name,
                                hinttext: '23'.tr,
                                iconData: Icons.person_outline,
                                labeltext: '20'.tr,
                                // mycontroller: ,
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 100, 'email');
                                },
                                mycontroller: controller.email,
                                hinttext: '12'.tr,
                                iconData: Icons.email_outlined,
                                labeltext: '18'.tr,
                                // mycontroller: ,
                              ),
                              CustomTextFormAuth(
                                obscureText: controller.isShowwPassword,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                isNumber: false,
                                mycontroller: controller.password,
                                valid: (value) {
                                  return validInput(value!, 5, 35, 'password');
                                },
                                hinttext: '13'.tr,
                                labeltext: '19'.tr,
                                iconData: Icons.lock_clock_outlined,
                              ),
                              CustomButtonAuth(
                                  color: AppColor.yellowColor,
                                  text: '17'.tr,
                                  onPressed: () {
                                    controller.signup();
                                    print('sign up');
                                  }),
                              const SizedBox(height: 40),
                              CustomTextSignUpOrSignIn(
                                textone: '25'.tr,
                                texttwo: '26'.tr,
                                onTap: () {
                                  controller.goToLogin();
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
      ),
    );
  }
}
