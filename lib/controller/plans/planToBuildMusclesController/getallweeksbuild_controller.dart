import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/plans/planToBuildMusclesData/getallweeksbuild_data.dart';

abstract class GetAllWeeksBuildController extends GetxController {
  getAllWeeks();
  goToWeekDetails(dynamic idOfWeek);
}

class GetAllWeeksBuildControllerImp extends GetAllWeeksBuildController {
  GetAllWeeksBuildData getAllWeeksBuildData = GetAllWeeksBuildData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List allWeeksList = [];
  MyService myService = Get.find();
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getAllWeeks();
    super.onInit();
  }

  @override
  getAllWeeks() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getAllWeeksBuildData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allWeeksList.addAll(response['data']);
      } else {
        Get.defaultDialog(title: 'Not Found', middleText: 'Empty Data!');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToWeekDetails(idOfWeek) {
    Get.toNamed(AppRoutes.getWeekDetailsBuild, arguments: {
      'idOfweek': idOfWeek,
    });
  }
}
