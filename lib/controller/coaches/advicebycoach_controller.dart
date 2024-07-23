import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/coaches/advicebycoach_data.dart';
import 'package:training_app/data/datasource/remote/coaches/askforadvice_data.dart';

abstract class AdviceByCoachController extends GetxController {
  getAdviceByCoach();
  goToRateAdvice(dynamic idofAdvice);
  askForAdvice();
  refreshPage();
}

class AdviceByCoachControllerImp extends AdviceByCoachController {
  AdviceByCoachData adviceByCoachData = AdviceByCoachData(Get.find());
  AskForAdviceData askForAdviceData = AskForAdviceData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List adviceByCoachList = [];
  Map askForAdviceMap = {};
  String? token;
  dynamic idCoach;
  int requestAdvice = 1;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idCoach = Get.arguments['idOfCoach'];
    getAdviceByCoach();
    super.onInit();
  }

  @override
  getAdviceByCoach() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adviceByCoachData.getData(token!, idCoach);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        adviceByCoachList.addAll(response['data']);
      } else {
        Get.defaultDialog(title: 'Sorry !', middleText: 'No Advice Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToRateAdvice(idofAdvice) {
    Get.toNamed(AppRoutes.rateAdvice, arguments: {
      'idOfAdvice': idofAdvice,
    });
  }

  @override
  askForAdvice() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await askForAdviceData.postData(
        token, idCoach.toString(), requestAdvice.toString());
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        askForAdviceMap.addAll(response['request_advice']);
      } else {
        Get.defaultDialog(
            title: 'Sorry !', middleText: 'SomeThing Went Error!');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  refreshPage() async {
    adviceByCoachList.clear();
    await getAdviceByCoach();
  }
}
