import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/challenge/allchallenge_date.dart';

abstract class AllChallengeController extends GetxController {
  getAllChallenge();
  goToChallengeDetail(dynamic idOfChallenge);
  refreshPage();
}

class AllChallengeControllerImp extends AllChallengeController {
  AllChallengeData allChallengeData = AllChallengeData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List allChallengeList = [];
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getAllChallenge();
    super.onInit();
  }

  @override
  getAllChallenge() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await allChallengeData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'Attached user to challenges') {
        allChallengeList.addAll(response['challenges']);
      } else {
        Get.defaultDialog(title: 'Sorry !', middleText: 'No Challenge Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToChallengeDetail(idOfChallenge) {
    Get.toNamed(AppRoutes.challengeInfo, arguments: {
      'idOfChallenge': idOfChallenge,
    });
  }

  @override
  refreshPage() async {
    allChallengeList.clear();
    await getAllChallenge();
  }
}
