import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/coaches/alladvicerequestbycoach_data.dart';

abstract class AllAdviceRequestByCoachController extends GetxController {
  allAdviceRequestByCoach();
}

class AllAdviceRequestByCoachControllerImp
    extends AllAdviceRequestByCoachController {
  AllAdviceRequestByCoachData adviceRequestByCoachData =
      AllAdviceRequestByCoachData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  dynamic token;
  List allAdviceRequestByCoachList = [];

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('tokenCoach');
    allAdviceRequestByCoach();
    super.onInit();
  }

  @override
  allAdviceRequestByCoach() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adviceRequestByCoachData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'Success') {
        allAdviceRequestByCoachList.addAll(response['data']);
      } else {
        Get.defaultDialog(title: 'Sorry !', middleText: 'No Requests Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
