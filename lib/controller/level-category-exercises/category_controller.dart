import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/category_data.dart';

abstract class CategoryController extends GetxController {
  getCategoryData();
  goToExercises(int selectedCategory, int selectedLevel);
}

class CategoryControllerImp extends CategoryController {
  CategoryData categoryData = CategoryData(Get.find());
  late StatusRequest statusRequest;
  List category = [];
  MyService myService = Get.find();
  String? token;
  dynamic idOfLevel;

  @override
  getCategoryData() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myService.sharedPreferences.getString('token');
    var response = await categoryData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'seccand page') {
        category.addAll(response['exercise']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    idOfLevel = Get.arguments['selectedLevel'];
    print('id of Level $idOfLevel');
    getCategoryData();
    super.onInit();
  }

  @override
  goToExercises(selectedCategory, selectedLevel) {
    Get.toNamed(AppRoutes.exercises, arguments: {
      'selectedCategory': selectedCategory,
      'selectedLevel': selectedLevel,
    });
  }
}
