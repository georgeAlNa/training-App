import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/data/datasource/remote/auth/verifycoderesetpassword_data.dart';

abstract class VerifyCodeConroller extends GetxController {
  verifyCode();
}

class VerifyCodeConrollerImp extends VerifyCodeConroller {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  VerifycodeResetPasswordData verifycodeResetPasswordData =
      VerifycodeResetPasswordData(Get.find());
  String? email;
  late TextEditingController verify;

  @override
  verifyCode() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifycodeResetPasswordData
          .postVerifycodeResetPasswordData(email!, verify.text);
      print('response ===  $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'the code is correct') {
          Get.offAllNamed(AppRoutes.resetPassword, arguments: {
            'email': email,
            'code': verify.text,
          });
        } else {
          Get.defaultDialog(
              title: 'warning', middleText: 'Unvalid verify reset pass code');
          statusRequest = StatusRequest.failuer;
        }
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
    super.onInit();
  }
}
