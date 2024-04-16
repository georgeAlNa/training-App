import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/auth/login_admin_data.dart';

abstract class LoginAdminController extends GetxController {
  loginAdmin();
  goToSignin();
}

class LoginAdminControllerImp extends LoginAdminController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowwPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginAdminData loginAdminData = LoginAdminData(Get.find());
  MyService myService = Get.find();

  showPassword() {
    isShowwPassword = isShowwPassword == true ? false : true;
    update();
  }

  @override
  loginAdmin() async {
    if (password.text != '12345678' && email.text != 'admin@gmail.com') {
      return Get.defaultDialog(
          title: 'warning', middleText: 'Email Not to Admin');
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginAdminData.postLoginAdminData(email.text, password.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'login ') {
          myService.sharedPreferences
              .setString('emailAdmin', response['data']['user']['email']);
          myService.sharedPreferences
              .setString('tokenAdmin', response['token']);
          myService.sharedPreferences.setString('stepLoginAdmin', '3');
          Get.offAllNamed(AppRoutes.adminPage,
              // arguments: {
              //   'tok1': response['token'],
              // }
              );
        }
        if (response['message'] == 'password is incorrecte') {
          Get.defaultDialog(
              title: 'warning', middleText: 'Sorry ! You are not admin');
        }
      } else {
        Get.defaultDialog(
            title: 'warning',
            middleText: 'Sorry ! You are not admin \n server fail');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  goToSignin() {
    Get.offAllNamed(AppRoutes.login);
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
