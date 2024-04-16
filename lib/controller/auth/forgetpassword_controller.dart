import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/data/datasource/remote/auth/forgetpassword_data.dart';

abstract class ForgetPasswordConroller extends GetxController {
  forgetPass();
  goToVerfiy();
}

class ForgetPasswordConrollerImp extends ForgetPasswordConroller {
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());

  @override
  forgetPass() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await forgetPasswordData.postForgetPasswordData(email.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'password reset code sent successfully.') {
          Get.offAllNamed(AppRoutes.verifyCode, arguments: {
            'email': email.text,
          });
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'Not Valid Email');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  goToVerfiy() {}

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
