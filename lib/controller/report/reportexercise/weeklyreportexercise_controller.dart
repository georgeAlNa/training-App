import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportexercise/weeklyreportexercise_data.dart';

abstract class WeeklyReportExerciseController extends GetxController {
  getWeeklyReportExercise();
  goToExerciseDetailReport(dynamic idOfExerciseReport);
}

class WeeklyReportExerciseControllerImp extends WeeklyReportExerciseController {
  WeeklyReportExerciseData weeklyReportExerciseData =
      WeeklyReportExerciseData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List weeklyReportexerciseList = [];
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getWeeklyReportExercise();
    super.onInit();
  }

  @override
  getWeeklyReportExercise() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await weeklyReportExerciseData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        weeklyReportexerciseList.addAll(response['Report For Wekkly']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToExerciseDetailReport(idOfExerciseReport) {
    Get.toNamed(
      AppRoutes.getExerciseByIdReport,
      // arguments: {
      //   'idOfExe': idOfExerciseReport,
      // }
    );
    myService.sharedPreferences.setInt('idExerciseReportfromResponse',
        weeklyReportexerciseList[idOfExerciseReport]['exercise_id']);
  }
}
