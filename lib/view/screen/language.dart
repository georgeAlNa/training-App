import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/localization/changelocale.dart';
import 'package:training_app/view/widget/language/custom_button_lang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButtonLanguage(
              langType: 'Arabic',
              onPressed: () {
                controller.chageLang('ar');
                Get.offAllNamed(AppRoutes.onBoarding);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLanguage(
              langType: 'English',
              onPressed: () {
                controller.chageLang('en');
                Get.offAllNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
