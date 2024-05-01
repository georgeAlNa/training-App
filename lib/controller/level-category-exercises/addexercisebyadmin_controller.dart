import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/addexercisebyadmin_data.dart';

abstract class AddExerciseController extends GetxController {
  exercise();
}

class AddExerciseControllerImp extends AddExerciseController {
  MyService myService = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  AddExerciseData addExerciseData = AddExerciseData(Get.find());
  late TextEditingController levelId;
  late TextEditingController categoryId;
  late TextEditingController name;
  late TextEditingController description;
  late TextEditingController date;
  late TextEditingController video;
  String? token;
  Map addExercise = {};

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('tokenAdmin');
    levelId = TextEditingController();
    categoryId = TextEditingController();
    name = TextEditingController();
    description = TextEditingController();
    date = TextEditingController();
    video = TextEditingController();
    //token = Get.arguments['token'];
    super.onInit();
  }

  @override
  exercise() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addExerciseData.postExerciseData(
          levelId.text,
          categoryId.text,
          name.text,
          description.text,
          date.text,
          video.text,
          token!);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'Exercise created successfully') {
          addExercise.addAll(response['exercise']);
          Get.defaultDialog(
              title: 'success', middleText: 'Add Exercise Success');
        }
        if (response['message'] == 'The exercise already exists') {
          Get.defaultDialog(
              title: "Error", middleText: "This exercise is existed");
        } else {
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
  void dispose() {
    levelId.dispose();
    categoryId.dispose();
    name.dispose();
    description.dispose();
    date.dispose();
    video.dispose();
    super.dispose();
  }
}
