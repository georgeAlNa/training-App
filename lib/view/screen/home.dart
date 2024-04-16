import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/home_controller.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/alertdialog.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return WillPopScope(
      onWillPop: alertDialog,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Find Product",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.grey[200]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const ListTile(
                        title: Text("A summer surprise",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        subtitle: Text("Cashback 20%",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(160)),
                      ),
                    ),
                  ],
                ),
              ),

              CustomButtomAuth(
                color: AppColor.primaryColor,
                text: 'level',
                onPressed: () {
                  Get.toNamed(AppRoutes.level);
                  print('level');
                },
              ),
              CustomButtomAuth(
                color: AppColor.primaryColor,
                text: 'user info',
                onPressed: () {
                  Get.toNamed(AppRoutes.userInfo);
                  print('user info');
                },
              ),
              CustomButtomAuth(
                color: AppColor.primaryColor,
                text: 'All Category Complete',
                onPressed: () {
                  Get.toNamed(AppRoutes.allCategoryComplete);
                  print('All Category Complete');
                },
              ),
              CustomButtomAuth(
                color: AppColor.primaryColor,
                text: 'Target Weight',
                onPressed: () {
                  Get.toNamed(AppRoutes.targetWeight);
                  print('Target weight');
                },
              ),
              CustomButtomAuth(
                color: AppColor.primaryColor,
                text: 'All Favorites',
                onPressed: () {
                  Get.toNamed(AppRoutes.getAllFavorites);
                  print('All Favorites');
                },
              ),
              CustomButtomAuth(
                color: AppColor.primaryColor,
                text: 'All Coaches',
                onPressed: () {
                  Get.toNamed(AppRoutes.getAllCoaches);
                  print('All Coaches');
                },
              ),
              const SizedBox(
                height: 120,
              ),
              CustomButtomAuth(
                text: 'log out',
                color: AppColor.redColor,
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Logout',
                    middleText: 'Sure Want Logout ?',
                    onConfirm: () {
                      Get.offAllNamed(AppRoutes.login);
                      controller.logOut();
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
              // Container(
              //   margin: const EdgeInsets.all(15),
              //   padding: const EdgeInsets.all(10),
              //   color: Colors.black,
              //   width: 50,
              //   height: 50,
              //   child: Center(
              //     child: GestureDetector(
              //       child: const Text(
              //         'log out',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       onTap: () {
              //         controller.logOut();
              //       },
              //     ),
              //   ),
              // ),

              //Text('name  ${controller.userName}'),
              //Text('email  ${controller.userEmail}'),
            ],
          ),
        ),
      ),
    );
  }
}
