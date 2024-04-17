import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/coaches/rateadvice_data.dart';

abstract class RateAdviceController extends GetxController {
  rateAdvice(dynamic idOfRate);
}

class RateAdviceControllerImp extends RateAdviceController {
  RateAdviceData rateAdviceData = RateAdviceData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? token;
  dynamic idOfAdvice;
  dynamic idOfRate;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfAdvice = Get.arguments['idOfAdvice'];
    super.onInit();
  }

  @override
  rateAdvice(idOfRate) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await rateAdviceData.getData(token!, idOfAdvice, idOfRate);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        //allCoachesList.addAll(response['coach']);
        Get.defaultDialog(
          title: response['rate'],
          middleText: response['messsage'],
        );
      } else {
        Get.defaultDialog(
          title: 'Sorry !',
          middleText: 'There was an Error',
        );
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  
}
