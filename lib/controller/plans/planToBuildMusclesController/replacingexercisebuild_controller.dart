import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/plans/planToBuildMusclesData/replacingexercisebuild_data.dart';

abstract class ReplacingExerciseBuildController extends GetxController {
  replaceExercise();
}

class ReplacingExerciseBuildControllerImp
    extends ReplacingExerciseBuildController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ReplacingExerciseBuildData replacingExerciseBuildData =
      ReplacingExerciseBuildData(Get.find());
  MyService myService = Get.find();
  late TextEditingController planiId;
  late TextEditingController oldExerciseiId;
  late TextEditingController newExerciseiId;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    planiId = TextEditingController();
    oldExerciseiId = TextEditingController();
    newExerciseiId = TextEditingController();
    super.onInit();
  }

  @override
  replaceExercise() async {
    if (planiId.text == '0' ||
        oldExerciseiId.text == '0' ||
        newExerciseiId.text == '0') {
      Get.defaultDialog(
          title: 'Warning', middleText: 'Value Cant Be As zero (0)');
    }
    // update();
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await replacingExerciseBuildData.postData(
          token!, planiId.text, oldExerciseiId.text, newExerciseiId.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'Plane Update Successfuly') {
          // Get.offAllNamed(AppRoutes.calories
          //     // arguments: {
          //     //    'name' : response['data']['user']['name'],
          //     //   'email' : response['data']['user']['email'],
          //     // }
          //     );
          Get.defaultDialog(
              title: 'Success', middleText: 'Success Replacing Exercise');
        }
      } else {
        Get.defaultDialog(
            title: 'Warning', middleText: 'Error in Replacing Exercise');
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
    planiId.dispose();
    oldExerciseiId.dispose();
    newExerciseiId.dispose();
    super.dispose();
  }
}
