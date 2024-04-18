import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/challenge/donechallenge_data.dart';
import 'package:training_app/data/datasource/remote/challenge/enrollchallenge_data.dart';

abstract class EnrollChallengeController extends GetxController {
  enrollChallenge();
  startTimerCountDown();
  nextExercise();
  onPageChange(int page);
  doneChallenge();
}

class EnrollChallengeControllerImp extends EnrollChallengeController {
  EnrollChallengeData enrollChallengeData = EnrollChallengeData(Get.find());
  DoneChallengeData doneChallengeData = DoneChallengeData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  PageController? pageController;

  Map enrollChallengeMap = {};
  List enrollChallengeExerciseList = [];
  String? token;
  dynamic idOfChallenge;
  // dynamic idOfExercise;
  dynamic timeLeft = 0;
  int currentPage = 0;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfChallenge = Get.arguments['idofchallenge'];
    pageController = PageController();

    // idOfExercise = Get.arguments['idOfExercise'];
    // timeLeft;
    enrollChallenge();
    super.onInit();
  }

  @override
  enrollChallenge() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await enrollChallengeData.getData(token!, idOfChallenge);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'Enrolled') {
        enrollChallengeMap.addAll(response['challenge']);
        enrollChallengeExerciseList.addAll(response['challenge']['exercises']);
        for (var i = 0; i < enrollChallengeExerciseList.length; i++) {
          timeLeft = timeLeft + enrollChallengeExerciseList[i]['date'];
          print('lissssst ${enrollChallengeExerciseList[i]['date']}');
        }
      } else {
        Get.defaultDialog(title: 'Sorry !', middleText: 'No Challenge Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  doneChallenge() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await doneChallengeData.putData(token!, idOfChallenge);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'The challenge completed') {
        Get.snackbar(
          "Done",
          "Challenge Successfully",
          duration: const Duration(seconds: 7),
        );
      }
      if (response['message'] == 'Failed, Try next time') {
        Get.defaultDialog(
            title: "Sorry !", middleText: "This Challenge already completed");
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
        //Get.defaultDialog(title: 'Done', middleText: 'Done this Challenge');
        doneChallenge();
        timer.cancel();
      }
    });
  }

  @override
  nextExercise() {
    currentPage++;
    if (currentPage > enrollChallengeExerciseList.length - 1) {
      print('doo');
    }
    pageController?.animateToPage(currentPage,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  onPageChange(int page) {
    currentPage = page;
    update();
  }
}
