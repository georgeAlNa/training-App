import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/auth/login_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/alertdialog.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/auth/textsignup.dart';
import 'package:training_app/view/widget/container/customappbarauth.dart';
import 'package:training_app/core/constant/imageasset.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return CustomAppBarAuth(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: Text(
      //     '9'.tr,
      //     style: const TextStyle(
      //       color: Colors.grey,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      title: '9'.tr,
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          alertDialog();
        },
        child: Stack(
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
                  child: GetBuilder<LoginControllerImp>(
                    builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColor.blackColor,
                                radius: 100,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height: 200,
                                  width: 300,
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomTextTitleAuth(
                                text: '10'.tr,
                              ),
                              const SizedBox(height: 15),
                              const CustomTextBodyAuth(
                                text: 'Sign In With Your Email And Password',
                              ),
                              const SizedBox(height: 45),
                              CustomTextFormAuth(
                                isNumber: false,
                                mycontroller: controller.email,
                                valid: (value) {
                                  return validInput(value!, 5, 100, 'email');
                                },
                                hinttext: '12'.tr,
                                labeltext: '18'.tr,
                                iconData: Icons.email_outlined,
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
                                iconData: controller.isShowwPassword
                                    ? Icons.remove_red_eye
                                    : Icons.panorama_fish_eye_sharp,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.forgetPassword);
                                  print('forget Password');
                                },
                                child: Text(
                                  '14'.tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              CustomButtonAuth(
                                color: AppColor.color,
                                text: '15'.tr,
                                onPressed: () {
                                  controller.login();
                                  print('sign in');
                                },
                              ),
                              // CustomButtonAuth(
                              //   color: AppColor.primaryColor,
                              //   text: 'Sign in As Admin',
                              //   onPressed: () {
                              //     Get.offAllNamed(AppRoutes.loginAdmin);
                              //     print('sign in as admin');
                              //   },
                              // ),
                              CustomButtonAuth(
                                color: AppColor.color,
                                text: 'Sign in As Coach',
                                onPressed: () {
                                  Get.offAllNamed(AppRoutes.loginCoach);
                                  print('Sign in As Coach');
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextSignUpOrSignIn(
                                textone: '16'.tr,
                                texttwo: '17'.tr,
                                onTap: () {
                                  controller.goToSignup();
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
