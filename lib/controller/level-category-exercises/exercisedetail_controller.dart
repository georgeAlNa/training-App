import 'dart:async';

import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/favorite/addfavorite_data.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/donexercise_data.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/exercisedetail_data.dart';

abstract class ExerciseDetailController extends GetxController {
  getExerciseDetailData();
  addExersiceToFavorite();
  doneExercise();
  startTimerCountDown();
}

class ExerciseDetailControllerImp extends ExerciseDetailController {
  ExerciseDetailData exerciseDetailData = ExerciseDetailData(Get.find());
  DoneExerciseData doneExerciseData = DoneExerciseData(Get.find());
  AddFavoriteData addFavoriteData = AddFavoriteData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List exercisedetail = [];
  Map fav = {};

  String? token;
  dynamic idOfLevel;
  dynamic idOfCategory;
  dynamic idOfExercise;
  dynamic isDone = 1;
  dynamic timeLeft;
  dynamic idOfExerciseResp;

  @override
  void onInit() {
    idOfLevel = Get.arguments['selectedLevelE'];
    print('id of Level $idOfLevel');
    idOfCategory = Get.arguments['selectedCategoryE'];
    print('id of Category $idOfCategory');
    idOfExercise = Get.arguments['selectedExercise'];
    print('id of Exercise $idOfExercise');
    token = myService.sharedPreferences.getString('token');
    idOfExerciseResp =
        myService.sharedPreferences.getInt('idExercisefromResponse');
    print('id Of Exercise Response : $idOfExerciseResp');
    getExerciseDetailData();
    super.onInit();
  }

  @override
  getExerciseDetailData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await exerciseDetailData.getData(token!, idOfLevel, idOfCategory);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'third page') {
        exercisedetail.addAll(response['Categories']);
        timeLeft = exercisedetail[idOfExercise]['date'];
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  addExersiceToFavorite() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addFavoriteData.postAddFavoriteData(
        token!, idOfExerciseResp.toString());
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        //fav.addAll(response['data']);
        Get.rawSnackbar(
            title: 'Done', message: 'Success Add Exercise to Favorite');
        //Get.toNamed(AppRoutes.exercisesDetail);
      } else {
        statusRequest = StatusRequest.failuer;
        // Get.defaultDialog(
        //     title: 'Error', middleText: 'Fail Add Exercise to Favorite');
        Get.rawSnackbar(
            title: 'Error', message: 'Fail Add Exercise to Favorite');
      }
    }
    update();
  }

  // @override
  // doneExercise() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await doneExerciseData.postDoneExerciseData(token!,
  //       idOfLevel.toString(), idOfCategory.toString(), isDone.toString());
  //   print('response ===== $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['message'] == 'Workout verification recorded successfully') {
  //       //doneExerciseMap.addAll(response['message']);
  //       //Get.offAllNamed(AppRoutes.home);
  //       Get.snackbar(
  //         "Done",
  //         "Workout verification recorded successfully",
  //         duration: const Duration(seconds: 7),
  //       );
  //     }
  //     if (response['message'] == 'Workout already completed for today') {
  //       Get.defaultDialog(
  //           title: "Sorry !",
  //           middleText: "This Workout already completed for today");
  //     }
  //   } else {
  //     statusRequest = StatusRequest.failuer;
  //     Get.defaultDialog(title: 'warning', middleText: 'error');
  //   }
  //   update();
  // }

  @override
  doneExercise() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await doneExerciseData.postDoneExerciseData(token!,
        idOfExerciseResp.toString(), isDone.toString());
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'The exercise has been recorded successfully') {
        //doneExerciseMap.addAll(response['message']);
        //Get.offAllNamed(AppRoutes.home);
        Get.snackbar(
          "Done",
          "The exercise has been recorded successfully",
          duration: const Duration(seconds: 7),
        );
      }
      if (response['message'] == 'The exercise for this day is already marked as done') {
        Get.defaultDialog(
            title: "Sorry !",
            middleText: "The exercise for this day is already marked as done");
      }
    } else {
      statusRequest = StatusRequest.failuer;
      Get.defaultDialog(title: 'warning', middleText: 'error');
    }
    update();
  }

  @override
  startTimerCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        update();
        timeLeft--;
      } else {
        doneExercise();
        timer.cancel();
      }
    });
  }

  // @override
  // goToDoneExercise() {
  //   Get.offAllNamed(AppRoutes.doneExercise, arguments: {
  //     'selectLevel': idOfLevel,
  //     'selectCategory': idOfCategory,
  //   });
  // }

  // @override
  // goToDoneAddToFavorite() {
  //   Get.toNamed(AppRoutes.doneAddToFavorite, arguments: {
  //     'exerciseId': idOfExercise,
  //   });
  // }
}
