import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportexercise/monthlyreportexercise_data.dart';

abstract class MonthlyReportExerciseController extends GetxController {
  getMonthlyReportExercise();
}

class MonthlyReportExerciseControllerImp
    extends MonthlyReportExerciseController {
  MonthlyReportExerciseData monthlyReportExerciseData = MonthlyReportExerciseData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List monthlyReportExerciseList = [];
  late TextEditingController month;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    month = TextEditingController();
    super.onInit();
  }

  @override
  getMonthlyReportExercise() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await monthlyReportExerciseData.getData(token!, month.text);
      print('response ==== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          monthlyReportExerciseList.addAll(response['Report for month']);
        } else {
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    }
  }

  @override
  void dispose() {
    month.dispose();
    super.dispose();
  }
}
