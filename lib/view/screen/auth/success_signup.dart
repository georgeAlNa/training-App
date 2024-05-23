import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/container/customappbarauth.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBarAuth(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: Text(
      //     '32'.tr,
      //     style: const TextStyle(
      //       color: Colors.grey,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      title: '32'.tr,
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.exercise,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        color: AppColor.greenColor,
                        size: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextTitleAuth(
                      text: '28'.tr,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextBodyAuth(
                      text: '43'.tr,
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButtonAuth(
                        color: AppColor.color,
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
        ],
      ),
    );
  }
}
