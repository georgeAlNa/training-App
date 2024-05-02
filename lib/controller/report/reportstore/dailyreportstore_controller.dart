import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportstore/dailyreportstore_data.dart';

abstract class DailyReportStoreController extends GetxController {
  getDailyReportStore();
}

class DailyReportStoreControllerImp extends DailyReportStoreController {
  DailyReportStoreData dailyReportStoreData = DailyReportStoreData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List dailyReportStoreList = [];
  String? token;


  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getDailyReportStore();
    super.onInit();
  }

  @override
  getDailyReportStore() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await dailyReportStoreData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        dailyReportStoreList.addAll(response['Report For Today']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
