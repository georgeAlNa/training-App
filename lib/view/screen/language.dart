import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/localization/changelocale.dart';
import 'package:training_app/view/widget/language/custom_button_lang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 5000,
              width: 5000,
              child: Image.asset(
                AppImageAsset.language,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: AppColor.yellow100Color,
                      shadows: const [
                        Shadow(
                          blurRadius: 20,
                          offset: Offset(1, 1),
                          color: AppColor.color,
                        ),
                      ],
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
          ],
        ),
      ),
    );
  }
}
