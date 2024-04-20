import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/auth/login_data.dart';

abstract class LoginConroller extends GetxController {
  login();
  goToSignup();
}

class LoginControllerImp extends LoginConroller {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowwPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyService myService = Get.find();

  showPassword() {
    isShowwPassword = isShowwPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (password.text == '12345678' && email.text == 'admin@gmail.com') {
      return Get.defaultDialog(
          title: 'warning', middleText: 'You cant sign in as Admin');
    }
    if (password.text == '12345678' && email.text == 'coutchAhmed@gmail.com') {
      return Get.defaultDialog(
          title: 'warning', middleText: 'You cant sign in as Coach');
    }
    if (password.text == '12345678' && email.text == 'coutchsamer@gmail.com') {
      return Get.defaultDialog(
          title: 'warning', middleText: 'You cant sign in as Coach');
    }
    if (password.text == '12345678' && email.text == 'coutchkarem@gmail.com') {
      return Get.defaultDialog(
          title: 'warning', middleText: 'You cant sign in as Coach');
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postLoginData(email.text, password.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'login ') {
          myService.sharedPreferences
              .setString('name', response['data']['user']['name']);
          myService.sharedPreferences
              .setString('email', response['data']['user']['email']);
          myService.sharedPreferences.setString('token', response['token']);
          myService.sharedPreferences.setInt('id', response['data']['user']['id']);
          myService.sharedPreferences.setString('stepLogin', '2');
          Get.offAllNamed(AppRoutes.calories
              // arguments: {
              //    'name' : response['data']['user']['name'],
              //   'email' : response['data']['user']['email'],
              // }
              );
        }
      } else {
        Get.defaultDialog(
            title: 'warning', middleText: 'error in email or password');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  goToSignup() {
    Get.offAllNamed(AppRoutes.signup);
  }

  @override
  void onInit() {
    // final token = FirebaseMessaging.instance.getToken();
    // print(token);
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
