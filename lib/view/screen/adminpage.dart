import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/adminpage_controller.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdminControllerImp controller = Get.put(AdminControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: AppColor.redColor,
            ),
            onPressed: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Sure Want Logout ?',
                onConfirm: () {
                  controller.logoutAdmin();
                  Get.snackbar(
                    'Log Out',
                    'Logging out',
                  );
                  print('log out to admin');
                },
                onCancel: () {
                  Get.back();
                },
                cancelTextColor: AppColor.blackColor,
                confirmTextColor: AppColor.blackColor,
              );
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomButtomAuth(
              text: 'Add Exercise',
              color: AppColor.primaryColor,
              onPressed: () {
                controller.goToAddExercise();
                print('add exercise');
              },
            ),
            CustomButtomAuth(
              text: 'Add Challenge',
              color: AppColor.primaryColor,
              onPressed: () {
                controller.goToAddChallenge();
                print('add challenge');
              },
            ),
            //Text('${controller.tok}'),
          ],
        ),
      ),
    );
  }
}
