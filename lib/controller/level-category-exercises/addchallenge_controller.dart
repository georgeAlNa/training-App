import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/addchallenge_data.dart';

abstract class AddChallengeController extends GetxController {
  challenge();
}

class AddChallengeControllerImp extends AddChallengeController {
  MyService myService = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  AddChallengeData addChallengeData = AddChallengeData(Get.find());
  late TextEditingController challengeName;
  late TextEditingController description;
  late TextEditingController endAt;
  late TextEditingController exerciseids1;
  late TextEditingController exerciseids2;
  late TextEditingController exerciseids3;
  late TextEditingController exerciseids4;
  late TextEditingController exerciseids5;
  late TextEditingController exerciseids6;
  late TextEditingController exerciseids7;
  late TextEditingController exerciseids8;
  late TextEditingController exerciseids9;
  late TextEditingController exerciseids10;
  // List exerciseidsStart = [];
  String? token;
  Map addChallenge = {};

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('tokenAdmin');
    challengeName = TextEditingController();
    description = TextEditingController();
    endAt = TextEditingController();
    exerciseids1 = TextEditingController();
    exerciseids2 = TextEditingController();
    exerciseids3 = TextEditingController();
    exerciseids4 = TextEditingController();
    exerciseids5 = TextEditingController();
    exerciseids6 = TextEditingController();
    exerciseids7 = TextEditingController();
    exerciseids8 = TextEditingController();
    exerciseids9 = TextEditingController();
    exerciseids10 = TextEditingController();
    super.onInit();
  }

  @override
  challenge() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addChallengeData.postChallengeData(
          challengeName.text,
          description.text,
          endAt.text,
          exerciseids1.text,
          exerciseids2.text,
          exerciseids3.text,
          exerciseids4.text,
          exerciseids5.text,
          exerciseids6.text,
          exerciseids7.text,
          exerciseids8.text,
          exerciseids9.text,
          exerciseids10.text,
          token!);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'challenge create successfuly') {
          addChallenge.addAll(response['challenge']);
          Get.defaultDialog(
              title: 'success', middleText: 'Add Challenge Success');
        }
        if (response['message'] == 'The Challenge already exists') {
          Get.defaultDialog(
              title: "Error", middleText: "This Challenge is existed");
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
    challengeName.dispose();
    description.dispose();
    endAt.dispose();
    exerciseids1.dispose();
    exerciseids2.dispose();
    exerciseids3.dispose();
    exerciseids4.dispose();
    exerciseids5.dispose();
    exerciseids6.dispose();
    exerciseids7.dispose();
    exerciseids8.dispose();
    exerciseids9.dispose();
    exerciseids10.dispose();
    super.dispose();
  }
}
