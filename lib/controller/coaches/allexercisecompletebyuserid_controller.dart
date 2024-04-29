import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/coaches/allexercisecompletebyuserid_data.dart';

abstract class AllExerciseCompleteByUserIdController extends GetxController {
  allExerciseComplete();
}

class AllExerciseCompleteByUserIdControllerImp
    extends AllExerciseCompleteByUserIdController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  AllExerciseCompleteByUserIdData allExerciseCompleteByUserIdData =
      AllExerciseCompleteByUserIdData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List allExerciseUserCompleteByIdList = [];
  late TextEditingController userId;
  String? token;
  bool isComplete = false;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('tokenCoach');
    userId = TextEditingController();
    super.onInit();
  }

  @override
  allExerciseComplete() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await allExerciseCompleteByUserIdData.postData(token!, userId.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'completed exercises') {
          isComplete = true;
          allExerciseUserCompleteByIdList.addAll(response['data']);
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'Not Valid User Id');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  void dispose() {
    userId.dispose();
    super.dispose();
  }
}
