import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportprogress/dailyreportprogress_data.dart';

abstract class DailyReportProgressController extends GetxController {
  getDailyReport();
}

class DailyReportProgressControllerImp extends DailyReportProgressController {
  DailyReportData dailyReportData = DailyReportData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List dailyReportList = [];
  String? token;


  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getDailyReport();
    super.onInit();
  }

  @override
  getDailyReport() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await dailyReportData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        dailyReportList.addAll(response['Report For Today']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
