import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportprogress/annualreportprogress_data.dart';

abstract class AnnualReportProgressController extends GetxController {
  getAnnualReport();
}

class AnnualReportProgressControllerImp extends AnnualReportProgressController {
  AnnualReportData annualReportData = AnnualReportData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List annualReportList = [];
  late TextEditingController year;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    year = TextEditingController();
    super.onInit();
  }

  @override
  getAnnualReport() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await annualReportData.getData(token!, year.text);
      print('response ==== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          annualReportList.addAll(response['Report']);
        } else {
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    }
  }

  @override
  void dispose() {
    year.dispose();
    super.dispose();
  }
}
