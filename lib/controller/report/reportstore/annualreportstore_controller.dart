import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportstore/annualreportstore_data.dart';

abstract class AnnualReportStoreController extends GetxController {
  getAnnualReportStore();
}

class AnnualReportStoreControllerImp extends AnnualReportStoreController {
  AnnualReportStoreData annualReportStoreData = AnnualReportStoreData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List annualReportStoreList = [];
  late TextEditingController year;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    year = TextEditingController();
    super.onInit();
  }

  @override
  getAnnualReportStore() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await annualReportStoreData.getData(token!, year.text);
      print('response ==== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          annualReportStoreList.addAll(response['Report For Year']);
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
