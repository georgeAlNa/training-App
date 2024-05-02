import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportexercise/getexercisebyid_data.dart';

abstract class GetExerciseByIdReportController extends GetxController {
  getExerciseByIdReport();
}

class GetExerciseByIdReportControllerImp
    extends GetExerciseByIdReportController {
  GetExerciseByIdReportData getExerciseByIdReportData =
      GetExerciseByIdReportData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List exerciseByIdReportList = [];
  String? token;
  dynamic idOfExe;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfExe =
        myService.sharedPreferences.getInt('idExerciseReportfromResponse');
    getExerciseByIdReport();
    super.onInit();
  }

  @override
  getExerciseByIdReport() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getExerciseByIdReportData.getData(token!, idOfExe);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        exerciseByIdReportList.addAll(response['Exercise']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
