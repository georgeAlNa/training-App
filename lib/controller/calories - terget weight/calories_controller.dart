import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/calories%20-%20terget%20weight/calories_data.dart';

abstract class CaloriesController extends GetxController {
  goToSuccessSignup();
}

class CaloriesControllerImp extends CaloriesController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController age;
  late TextEditingController currentWeight;
  late TextEditingController gender;
  late TextEditingController height;
  String? token;
  Map caloriesDataList = {};
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CaloriesData caloriesData = CaloriesData(Get.find());

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    age = TextEditingController();
    currentWeight = TextEditingController();
    gender = TextEditingController();
    height = TextEditingController();
    super.onInit();
  }

  @override
  goToSuccessSignup() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await caloriesData.postCaloriesData(
          token!, age.text, currentWeight.text, gender.text, height.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          caloriesDataList.addAll(response['data']);
          myService.sharedPreferences
              .setInt('idOfCalories', response['data']['id']);
              myService.sharedPreferences
              .setString('ageUser', response['data']['age']);
              myService.sharedPreferences
              .setString('currentWeightUser', response['data']['Current_weight']);
              myService.sharedPreferences
              .setString('genderUser', response['data']['gender']);
              myService.sharedPreferences
              .setString('heightUser', response['data']['height']);
          myService.sharedPreferences.setString('stepCalories', '4');
          Get.offAllNamed(AppRoutes.home);
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
    age.dispose();
    currentWeight.dispose();
    gender.dispose();
    height.dispose();
    super.dispose();
  }
}
