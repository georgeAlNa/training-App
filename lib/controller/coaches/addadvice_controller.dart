import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/coaches/addadvice_date.dart';

abstract class AddAdviceController extends GetxController {
  addAdvice();
  logoutcoach();
}

class AddAdviceControllerImp extends AddAdviceController {
  MyService myService = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  AddAdviceData addAdviceData = AddAdviceData(Get.find());
  late TextEditingController message;
  late TextEditingController trainerId;

  String? token;
  Map addAdviceMap = {};

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('tokenCoach');
    message = TextEditingController();
    trainerId = TextEditingController();
    super.onInit();
  }

  @override
  addAdvice() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addAdviceData.postAdviceeData(
          message.text, trainerId.text, token!);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          addAdviceMap.addAll(response['advice']);
          Get.defaultDialog(title: 'success', middleText: 'Add Advice Success');
        }
        if (response['message'] == 'Advice for this trainer already exists') {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Advice for this trainer already exists");
        }
      } else {
        Get.defaultDialog(title: "Error", middleText: "Error in server");
        statusRequest = StatusRequest.serverfailure;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  void dispose() {
    message.dispose();
    trainerId.dispose();
    super.dispose();
  }

  @override
  logoutcoach() {
    myService.sharedPreferences.remove('idCoach');
    myService.sharedPreferences.remove('tokenCoach');
    Get.offAllNamed(AppRoutes.loginCoach);
  }
}
