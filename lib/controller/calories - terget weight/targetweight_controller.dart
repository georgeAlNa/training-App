import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/calories%20-%20terget%20weight/targetweight_data.dart';

abstract class TargetWeightController extends GetxController {
  targetWeightFun();
}

class TargetWeightControllerImp extends TargetWeightController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController targetWeight;
  String? token;
  String? age;
  String? gender;
  String? height;
  String? currentWeight;
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TargetWeightData targetWeightData = TargetWeightData(Get.find());

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    age = myService.sharedPreferences.getString('ageUser');
    gender = myService.sharedPreferences.getString('genderUser');
    height = myService.sharedPreferences.getString('heightUser');
    currentWeight = myService.sharedPreferences.getString('currentWeightUser');
    targetWeight = TextEditingController();
    super.onInit();
  }

  @override
  targetWeightFun() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await targetWeightData.postTargetWeightData(
          token!, age!, gender!, height!, currentWeight!, targetWeight.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          Get.defaultDialog(
              title: 'You need a number of days to lose 0.45 of your weight',
              middleText:
                  '${response['You need a number of days to lose 0.45 of your weight']}');
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'Error In Some Where');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  void dispose() {
    targetWeight.dispose();
    super.dispose();
  }
}
