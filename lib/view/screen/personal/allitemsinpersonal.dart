import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/personal/allitemsinpersonal_controller.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/container/Container2.dart';

class AllItemsInPersonalPage extends StatelessWidget {
  const AllItemsInPersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllItemsInPersonalControllerImp());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(1),
      child: Stack(
        children: [
          SizedBox(
            height: 5000,
            child: Image.asset(
              AppImageAsset.sport,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<AllItemsInPersonalControllerImp>(
            builder: (controller) => ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container2(
                  title: 'Personal Info',
                  onTap: () {
                    controller.goToUserInfoPage();
                    // AppRoutes.userInfo;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container2(
                  title: 'Coaches',
                  onTap: () {
                    controller.goToAllCoachesPage();
                    // AppRoutes.getAllCoaches;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container2(
                  title: 'Language',
                  onTap: () {
                    controller.goToLanguagePage();
                    // AppRoutes.language;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container2(
                  title: 'Target Weight',
                  onTap: () {
                    controller.goToTargetWeightPage();
                    // AppRoutes.language;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container2(
                  title: 'Edit Your Info',
                  onTap: () {
                    controller.goToEditInfoPage();
                    // AppRoutes.language;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                // const Container1(text: "logout", page: ()),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButtonAuth(
                    text: 'Log Out',
                    color: AppColor.redColor,
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Logout',
                        middleText: 'Sure Want Logout ?',
                        onConfirm: () {
                          // Get.offAllNamed(AppRoutes.login);
                          // AppRoutes.home;
                          controller.logout();
                          Get.snackbar(
                            'Log Out',
                            'Logging out',
                          );
                          print('log out');
                        },
                        onCancel: () {
                          Get.back();
                        },
                        cancelTextColor: AppColor.blackColor,
                        confirmTextColor: AppColor.blackColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
