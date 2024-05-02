import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportstore/weeklyreportstore_data.dart';

abstract class WeeklyReportStoreController extends GetxController {
  getWeeklyReportStore();
}

class WeeklyReportStoreControllerImp extends WeeklyReportStoreController {
  WeeklyReportStoreData weeklyReportStoreData = WeeklyReportStoreData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List weeklyReportStoreList = [];
  String? token;


  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getWeeklyReportStore();
    super.onInit();
  }

  @override
  getWeeklyReportStore() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await weeklyReportStoreData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        weeklyReportStoreList.addAll(response['Report for Week']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
