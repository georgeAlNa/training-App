import 'dart:async';

import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/plans/planToLossWeightData/getweekdetailsloss_data.dart';

abstract class GetExercieDetailLossController extends GetxController {
  getExerciseDetails();
  startTimerCountDown();
}

class GetExercieDetailLossControllerImp extends GetExercieDetailLossController {
  GetWeekDetailsLossdData getWeekDetailsLossdData =
      GetWeekDetailsLossdData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List getExerciseDetailsList = [];
  MyService myService = Get.find();
  String? token;
  dynamic idOfWeek;
  dynamic idOfExercise;
  dynamic timeLeft;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfWeek = Get.arguments['idOfweek'];
    idOfExercise = Get.arguments['exercisesDetailLoss'];
    getExerciseDetails();
    super.onInit();
  }

  @override
  getExerciseDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getWeekDetailsLossdData.getData(token!, idOfWeek);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        getExerciseDetailsList.addAll(response['data']);
        timeLeft = getExerciseDetailsList[idOfExercise]['date'];
      } else {
        Get.defaultDialog(title: 'Not Found', middleText: 'Empty Data!');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  startTimerCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        update();
        timeLeft--;
      } else {
        Get.defaultDialog(title: 'Done', middleText: 'Done');
        // doneExercise();
        timer.cancel();
      }
    });
  }
}
