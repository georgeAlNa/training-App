import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyService myService = Get.find();

  chageLang(String langcode) {
    Locale locale = Locale(langcode);
    myService.sharedPreferences.setString('lang', langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? savedLanguageCode = myService.sharedPreferences.getString('lang');
    if (savedLanguageCode == 'ar') {
      language = const Locale('ar');
    } else if (savedLanguageCode == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
