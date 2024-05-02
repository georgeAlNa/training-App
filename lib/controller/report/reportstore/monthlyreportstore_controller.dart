import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportstore/monthlyreportstore_data.dart';

abstract class MonthlyReportStoreController extends GetxController {
  getMonthlyReportStore();
}

class MonthlyReportStoreControllerImp
    extends MonthlyReportStoreController {
  MonthlyReportStoreData monthlyReportStoreData = MonthlyReportStoreData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List monthlyReportStoreList = [];
  late TextEditingController month;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    month = TextEditingController();
    super.onInit();
  }

  @override
  getMonthlyReportStore() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await monthlyReportStoreData.getData(token!, month.text);
      print('response ==== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          monthlyReportStoreList.addAll(response['Report For Month']);
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
