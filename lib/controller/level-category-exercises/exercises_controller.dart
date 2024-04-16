import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/exercises_data.dart';

abstract class ExerciseController extends GetxController {
  getExerciseData();
  goToExercisesDetail(int idOfExercise);
}

class ExerciseControllerImp extends ExerciseController {
  ExerciseData exerciseData = ExerciseData(Get.find());
  late StatusRequest statusRequest;
  List exercise = [];
  MyService myService = Get.find();
  String? token;
  dynamic idOfLevel;
  dynamic idOfCategory;
  dynamic idOfExercise;

  @override
  void onInit() {
    idOfLevel = Get.arguments['selectedLevel'];
    print('id of Level $idOfLevel');
    idOfCategory = Get.arguments['selectedCategory'];
    print('id of Category $idOfCategory');
    getExerciseData();
    super.onInit();
  }

  @override
  getExerciseData() async {
    statusRequest = StatusRequest.loading;
    update();
    token = myService.sharedPreferences.getString('token');
    var response = await exerciseData.getData(token!, idOfLevel, idOfCategory);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'third page') {
        exercise.addAll(response['Categories']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToExercisesDetail(idOfExercise) {
    Get.toNamed(AppRoutes.exercisesDetail, arguments: {
      'selectedLevelE': idOfLevel,
      'selectedCategoryE': idOfCategory,
      'selectedExercise': idOfExercise,
    });
  }
}
