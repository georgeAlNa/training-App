import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportprogress/monthlyreportprogress_data.dart';

abstract class MonthlyReportProgressController extends GetxController {
  getMonthlyReport();
}

class MonthlyReportProgressControllerImp
    extends MonthlyReportProgressController {
  MonthlyReportData monthlyReportData = MonthlyReportData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List monthlyReportList = [];
  late TextEditingController month;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    month = TextEditingController();
    super.onInit();
  }

  @override
  getMonthlyReport() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await monthlyReportData.getData(token!, month.text);
      print('response ==== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          monthlyReportList.addAll(response['Report']);
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
