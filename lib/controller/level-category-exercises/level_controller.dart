import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/level_data.dart';

abstract class LevelController extends GetxController {
  getLevelData();
  goToCategory(int selectedLevel);
}

class LevelControllerImp extends LevelController {
  LevelData levelData = LevelData(Get.find());
  late StatusRequest statusRequest;
  List level = [];
  MyService myService = Get.find();
  String? token;

  // List<LevelModel> list =  List.from(LevelModel as Iterable);

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getLevelData();
    super.onInit();
  }

  @override
  getLevelData() async {
    statusRequest = StatusRequest.loading;
    update();
    // token = myService.sharedPreferences.getString('token');
    var response = await levelData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'first page') {
        level.addAll(response['levels']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToCategory(selectedLevel) {
    Get.toNamed(AppRoutes.category, arguments: {
      'selectedLevel': selectedLevel,
    });
  }
}
