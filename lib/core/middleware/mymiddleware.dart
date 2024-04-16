import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  MyService myService = Get.find();

  @override
  int get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharedPreferences.getString('stepLogin') == '2') {
      return const RouteSettings(name: AppRoutes.home);
    }
    if (myService.sharedPreferences.getString('stepLoginAdmin') == '3') {
      return const RouteSettings(name: AppRoutes.adminPage);
    }
    // if (myService.sharedPreferences.getString('stepCalories') == '4') {
    //   return const RouteSettings(name: AppRoutes.home);
    // }
    if (myService.sharedPreferences.getString('stepOnboarding') == '1') {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
