import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/data/datasource/remote/auth/verifycodesignup_data.dart';

abstract class VerifyCodeSignUpConroller extends GetxController {
  verifyCode();
}

// String verificationCode
class VerifyCodeSignUpConrollerImp extends VerifyCodeSignUpConroller {
  String? email;
  String? token;
  late TextEditingController verify;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  //late String verfiycode;
  StatusRequest statusRequest = StatusRequest.none;
  VerifycodeSignUpData verifycodeSignUpData = VerifycodeSignUpData(Get.find());

  @override
  // verificationCode
  verifyCode() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifycodeSignUpData.postVerifycodeSignUpData(
          email!, verify.text, token!);
      print('response ===  $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'login successful.') {
          Get.offNamed(AppRoutes.successSignup);
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'Unvalid verify code');
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
    verify = TextEditingController();
    email = Get.arguments['email'];
    token = Get.arguments['token'];
    super.onInit();
  }

  @override
  void dispose() {
    verify.dispose();
    super.dispose();
  }
}
