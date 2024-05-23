import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportexercise/getexercisebyid_data.dart';

abstract class GetExerciseByIdSearchController extends GetxController {
  getExerciseByIdSearch();
}

class GetExerciseByIdSearchControllerImp
    extends GetExerciseByIdSearchController {
  GetExerciseByIdReportData getExerciseByIdReportData =
      GetExerciseByIdReportData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List exerciseByIdSearchList = [];
  String? token;
  dynamic idOfExeSearch;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfExeSearch =
        myService.sharedPreferences.getInt('idExerciseFromResponseSearch');
    getExerciseByIdSearch();
    super.onInit();
  }

  @override
  getExerciseByIdSearch() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await getExerciseByIdReportData.getData(token!, idOfExeSearch);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        exerciseByIdSearchList.addAll(response['Exercise']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
