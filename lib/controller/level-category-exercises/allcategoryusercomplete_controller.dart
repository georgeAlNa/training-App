import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/allcategoryusercomplete_data.dart';

abstract class AllCategoryAndExerciseCompleteController extends GetxController {
  // getAllCategoryCompleteData();
  getAllExerciseCompleteData();
}

class AllCategoryAndExerciseCompleteControllerImp
    extends AllCategoryAndExerciseCompleteController {
  AllExerciseCompleteData allExerciseCompleteData =
      AllExerciseCompleteData(Get.find());
  // AllCategoryCompleteData allCategoryCompleteData =
  //     AllCategoryCompleteData(Get.find());
  late StatusRequest statusRequest;
  // List completeCategory = [];
  List completeExerciseList = [];
  MyService myService = Get.find();
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    // getAllCategoryCompleteData();
    getAllExerciseCompleteData();
    super.onInit();
  }

  @override
  getAllExerciseCompleteData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await allExerciseCompleteData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'completed exercises') {
        completeExerciseList.addAll(response['data']);
      }
      if (completeExerciseList.isEmpty) {
        Get.defaultDialog(
            title: 'Empty', middleText: 'No Exercises ! Still Empty');
        statusRequest = StatusRequest.failuer;
      }
    } else {
      Get.defaultDialog(title: 'Error', middleText: 'Something went wrong !');
    }
    update();
  }

  // @override
  // getAllCategoryCompleteData() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await allCategoryCompleteData.getData(token!);
  //   print('response ==== $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['message'] == 'completed category') {
  //       completeCategory.addAll(response['data']);
  //     }
  //     if (completeCategory.isEmpty) {
  //       Get.defaultDialog(title: 'Empty', middleText: 'No Data ! Still Empty');
  //       statusRequest = StatusRequest.failuer;
  //     }
  //   }
  //   update();
  // }
}
