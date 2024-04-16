import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '48'.tr,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Icon(
                    Icons.check_circle_outline_outlined,
                    color: AppColor.primaryColor,
                    size: 200,
                  ),
                ),
                CustomTextTitleAuth(
                  text: '32'.tr,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextBodyAuth(
                  text: '36'.tr,
                ),
                const SizedBox(
                  height: 200,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtomAuth(
                    color: AppColor.primaryColor,
                    text: '31'.tr,
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.login);
                      print('go to login ');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
