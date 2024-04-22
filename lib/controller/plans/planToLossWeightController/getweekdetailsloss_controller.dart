import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/plans/planToLossWeightData/getweekdetailsloss_data.dart';

abstract class GetWeekDetailLossController extends GetxController {
  getWeekDetails();
  goToUpdateExercise();
}

class GetWeekDetailLossControllerImp extends GetWeekDetailLossController {
  GetWeekDetailsLossdData getWeekDetailsLossdData =
      GetWeekDetailsLossdData(Get.find());
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
    var response = await getWeekDetailsLossdData.getData(token!, idOfWeek);
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
    Get.toNamed(AppRoutes.replacingExerciseLoss);
  }

  // @override
  // goToWeekDetails(idOfWeek) {}
}
