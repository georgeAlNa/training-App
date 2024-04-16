// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/static/static_on_boarding.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int page);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  MyService myService = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBoaredingList.length - 1) {
      myService.sharedPreferences.setString('stepOnboarding', '1');
      Get.offAllNamed(AppRoutes.login);
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  onPageChange(int page) {
    currentPage = page;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
