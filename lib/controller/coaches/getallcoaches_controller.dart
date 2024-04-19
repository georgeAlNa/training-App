import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/coaches/advicebycoach_data.dart';
import 'package:training_app/data/datasource/remote/coaches/getallcoaches_data.dart';

abstract class AllCoachesController extends GetxController {
  getAllCoaches();
  goToAdviceCreateByCoach(dynamic idOfCoach);
}

class AllCoachesControllerImp extends AllCoachesController {
  AllCoachesData allCoachesData = AllCoachesData(Get.find());
  AdviceByCoachData adviceByCoachData = AdviceByCoachData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Map allCoachesMap = {};
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getAllCoaches();
    super.onInit();
  }

  @override
  getAllCoaches() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await allCoachesData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allCoachesMap.addAll(response['coach']);
      } else {
        Get.defaultDialog(title: 'Sorry !', middleText: 'No Coaches Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToAdviceCreateByCoach(idOfCoach) {
    Get.toNamed( AppRoutes.adviceByCoach , arguments: {
      'idOfCoach' : idOfCoach,
    });
  }
}
