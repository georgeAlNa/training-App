import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/plans/planToBuildMusclesData/getweekdetailsbuild_data.dart';

abstract class GetWeekDetailBuildController extends GetxController {
  getWeekDetails();
  goToUpdateExercise();
  goToExerciseDetail(dynamic selectedExercise);
}

class GetWeekDetailBuildControllerImp extends GetWeekDetailBuildController {
  GetWeekDetailsBuilddData getWeekDetailsBuilddData =
      GetWeekDetailsBuilddData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List getWeekDetailsList = [];
  MyService myService = Get.find();
  String? token;
  dynamic idOfWeek;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfWeek = Get.arguments['idOfweek'];
    getWeekDetails();
    super.onInit();
  }

  @override
  getWeekDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getWeekDetailsBuilddData.getData(token!, idOfWeek);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        getWeekDetailsList.addAll(response['data']);
      } else {
        Get.defaultDialog(title: 'Not Found', middleText: 'Empty Data!');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToUpdateExercise() {
    Get.toNamed(AppRoutes.replacingExerciseBuild);
  }

  @override
  goToExerciseDetail(selectedExercise) async {
    Get.toNamed(AppRoutes.getExerciseDetailsBuild, arguments: {
      'idOfweek': idOfWeek,
      'exercisesDetailBuild': selectedExercise,
    });
  }


  // @override
  // goToWeekDetails(idOfWeek) {}
}
