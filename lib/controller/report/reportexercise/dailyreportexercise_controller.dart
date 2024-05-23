import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/report/reportexercise/dailyreportexercise_data.dart';

abstract class DailyReportExerciseController extends GetxController {
  getDailyReportExercise();
  goToExerciseDetailReport(dynamic idOfExerciseReport);
}

class DailyReportExerciseControllerImp extends DailyReportExerciseController {
  DailyReportExerciseData dailyReportExerciseData =
      DailyReportExerciseData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List dailyReportExerciseList = [];
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getDailyReportExercise();
    super.onInit();
  }

  @override
  getDailyReportExercise() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await dailyReportExerciseData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        dailyReportExerciseList.addAll(response['Report for today']);
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
      //  arguments: {
      //   'idOfExe': idOfExerciseReport,
      // }
    );
    myService.sharedPreferences.setInt('idExerciseReportfromResponse',
        dailyReportExerciseList[idOfExerciseReport]['exercise_id']);
  }
}
