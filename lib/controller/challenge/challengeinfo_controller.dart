import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/challenge/challengeinfo_data.dart';

abstract class ChallengeInfoController extends GetxController {
  challengeInfo();
  goToEnrollChallenge();
}

class ChallengeInfoControllerImp extends ChallengeInfoController {
  ChallengeInfoData challengeInfoData = ChallengeInfoData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Map challengeInfoMap = {};
  List challengeInfoExerciseList = [];
  String? token;
  dynamic idOfChallenge;
  // dynamic idOfExercise;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfChallenge = Get.arguments['idOfChallenge'];
    challengeInfo();
    super.onInit();
  }

  @override
  challengeInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await challengeInfoData.getData(token!, idOfChallenge);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        challengeInfoMap.addAll(response['challenge']);
        challengeInfoExerciseList.addAll(response['exercises']);
        // for (var i = 1; i < 100; i++) {
        //   idOfExercise = response['exercises'][i]['id'];
        // }
      } else {
        Get.defaultDialog(title: 'Sorry !', middleText: 'No Challenge Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToEnrollChallenge() {
    Get.toNamed(AppRoutes.enrollChallenge, arguments: {
      'idofchallenge': idOfChallenge,
      // 'idOfExercise': idOfExercise,
    });
  }
}
