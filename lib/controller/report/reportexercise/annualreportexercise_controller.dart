import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportexercise/annualreportexercise_data.dart';

abstract class AnnualReportExerciseController extends GetxController {
  getAnnualReportExercise();
  goToExerciseDetailReport(dynamic idOfExerciseReport);
}

class AnnualReportExerciseControllerImp extends AnnualReportExerciseController {
  AnnualReportExerciseData annualReportExerciseData =
      AnnualReportExerciseData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List annualReportExerciseList = [];
  late TextEditingController year;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    year = TextEditingController();
    super.onInit();
  }

  @override
  getAnnualReportExercise() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await annualReportExerciseData.getData(token!, year.text);
      print('response ==== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          annualReportExerciseList.addAll(response['Report For annul']);
        } else {
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    }
  }

  @override
  goToExerciseDetailReport(idOfExerciseReport) {
    Get.toNamed(AppRoutes.getExerciseByIdReport, arguments: {
      'idOfExe': idOfExerciseReport,
    });
    myService.sharedPreferences.setInt('idExerciseReportfromResponse',
        annualReportExerciseList[idOfExerciseReport]['exercise_id']);
  }

  @override
  void dispose() {
    year.dispose();
    super.dispose();
  }
}
