import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/data/datasource/remote/auth/resetpassword_data.dart';

abstract class ResetPasswordConroller extends GetxController {
  resetPass();
}

class ResetPasswordConrollerImp extends ResetPasswordConroller {
  //late TextEditingController rePassword;
  String? email;
  String? code;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  bool isShowwPassword = true;

  showPassword() {
    isShowwPassword = isShowwPassword == true ? false : true;
    update();
  }

  @override
  resetPass() async {
    // if (password.text != rePassword.text) {
    //   return Get.defaultDialog(
    //       title: 'warning', middleText: 'Passwords do not match');
    // }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postResetpasswordData(
          email!, code!, password.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'password reset successfully.') {
          Get.offAllNamed(AppRoutes.successResetPassword);
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'Try Again');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    //rePassword = TextEditingController();
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }
}
