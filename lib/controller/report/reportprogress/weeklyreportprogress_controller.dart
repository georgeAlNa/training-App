import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportprogress/weeklyreportprogress_data.dart';

abstract class WeeklyReportProgressController extends GetxController {
  getWeeklyReport();
}

class WeeklyReportProgressControllerImp extends WeeklyReportProgressController {
  WeeklyReportData weeklyReportData = WeeklyReportData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List weeklyReportList = [];
  String? token;


  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getWeeklyReport();
    super.onInit();
  }

  @override
  getWeeklyReport() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await weeklyReportData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        weeklyReportList.addAll(response['Report']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
