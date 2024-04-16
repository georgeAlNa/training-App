import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/auth/signup_data.dart';

abstract class SignupConroller extends GetxController {
  signup();
  goToLogin();
}

class SignupControllerImp extends SignupConroller {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  //late TextEditingController confirmPassword;
  //late TextEditingController phone;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowwPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signupData = SignUpData(Get.find());
  MyService myService = Get.find();

  showPassword() {
    isShowwPassword = isShowwPassword == true ? false : true;
    update();
  }

  @override
  signup() async {
    if (password.text == '12345678' && email.text == 'admin@gmail.com') {
      return Get.defaultDialog(
          title: 'warning', middleText: 'You cant sign up as Admin');
    }
    //var formdata = formState.currentState;
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await signupData.postSignupData(name.text, email.text, password.text);
      print('response ===  $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          myService.sharedPreferences
              .setString('tokenSignUp', response['token']);
          Get.offAllNamed(AppRoutes.verifyCodeSignUp, arguments: {
            'email': email.text,
            'token': response['token'],
          });
        }
      } else {
        Get.defaultDialog(
            title: 'warning', middleText: 'unreal email or exist email');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    //phone = TextEditingController();
    // confirmPassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    //confirmPassword.dispose();
    //phone.dispose();

    super.dispose();
  }
}
