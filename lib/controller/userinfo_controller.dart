import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/userinfo_data.dart';

abstract class UserInfoController extends GetxController {
  getUserInfo();
}

class UserInfoControllerImp extends UserInfoController {
  UserInfoData userInfoData = UserInfoData(Get.find());
  late StatusRequest statusRequest;
  List info = [];
  MyService myService = Get.find();
  String? token;
  dynamic idOfCalories;
  dynamic emailofuser;
  dynamic nameofuser;
  dynamic pointsofuser;

  @override
  void onInit() {
    idOfCalories = myService.sharedPreferences.getInt('idOfCalories');
    emailofuser = myService.sharedPreferences.getString('email');
    nameofuser = myService.sharedPreferences.getString('name');
    pointsofuser = myService.sharedPreferences.getInt('points');
    getUserInfo();
    super.onInit();
  }

  @override
  getUserInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myService.sharedPreferences.getString('token');
    var response = await userInfoData.getData(token!, idOfCalories);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        info.addAll(response['Details']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
