import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/home_controller.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/alertdialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return WillPopScope(
      onWillPop: alertDialog,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "FitNess ",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                "Gym",
                style: TextStyle(
                  fontSize: 30,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 248, 250, 246),
            fontSize: 30,
          ),
          centerTitle: true,
          elevation: 20,
          shadowColor: Colors.greenAccent,
          // centerTitle: true,
          backgroundColor: AppColor.color,
          leading: const CircleAvatar(
            radius: 5,
            backgroundImage: AssetImage(
              AppImageAsset.logo,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.store,
                color: Colors.black,
              ),
              iconSize: 30,
              onPressed: () {
                Get.toNamed(AppRoutes.storeCategory);
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              iconSize: 30,
              color: Colors.black,
              onPressed: () {
                Get.toNamed(AppRoutes.search);
              },
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<HomeControllerImp>(
          builder: (controllerBottomNav) => BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColor.color,
            selectedFontSize: 15,
            unselectedFontSize: 10,
            selectedLabelStyle: const TextStyle(fontSize: 17),
            onTap: (val) {
              controllerBottomNav.selectedindex = val;
              controllerBottomNav.update();
              // print(controllerButtomNav.selectedindex);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 35,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_kabaddi,
                  size: 35,
                ),
                label: "Sports",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                ),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message_outlined,
                  size: 35,
                ),
                label: "Report",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 35,
                ),
                label: "Notification",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 35,
                ),
                label: "Person",
              ),
            ],
            currentIndex: controllerBottomNav.selectedindex,
          ),
        ),
        body: GetBuilder<HomeControllerImp>(
          builder: (controllerBody) => Container(
            child: controllerBody.listWidget
                .elementAt(controllerBody.selectedindex),
          ),
        ),
        // body: GetBuilder<HomeControllerImp>(
        //   builder: (controllerBody) => Scaffold(
        //     body: Container(
        //       margin: const EdgeInsets.all(15),
        //       child: ListView(
        //         children: [
        //           Container(
        //             margin: const EdgeInsets.only(top: 10),
        //             child: CustomAppBar(
        //               mycontroller: controllerBody.searchContent,
        //               titleappbar: 'Find Exercise',
        //               onPressedIconFavorite: () {
        //                 Get.toNamed(AppRoutes.getAllFavorites);
        //               },
        //               onPressedSearch: () {
        //                 controllerBody.onSearchItems();
        //               },
        //               onChanged: (val) {
        //                 controllerBody.checkSearch(val);
        //               },
        //             ),
        //           ),
        //           HandlingDataView(
        //             statusRequest: controllerBody.statusRequest,
        //             widget: controllerBody.isSearch
        //                 ? ListView.builder(
        //                     itemCount: controllerBody.searchList.length,
        //                     shrinkWrap: true,
        //                     physics: const NeverScrollableScrollPhysics(),
        //                     itemBuilder: (context, index) {
        //                       return CustomButtonSearch(
        //                         color: AppColor.primaryColor,
        //                         textTitle:
        //                             '${controllerBody.searchList[index]['name']}\n',
        //                         textSubject:
        //                             '${controllerBody.searchList[index]['description']}\n',
        //                         textDate:
        //                             'Date : ${controllerBody.searchList[index]['date']}\n',
        //                         textVideo:
        //                             'Video : ${controllerBody.searchList[index]['video']}',
        //                         onPressed: () {
        //                           //controller.goToCategory(index + 1);
        //                           print('search');
        //                         },
        //                       );
        //                     },
        //                   )
        //                 : GridView(
        //                     shrinkWrap: true,
        //                     physics: const NeverScrollableScrollPhysics(),
        //                     gridDelegate:
        //                         const SliverGridDelegateWithFixedCrossAxisCount(
        //                       crossAxisCount: 2,
        //                       childAspectRatio: 1.3,
        //                       mainAxisSpacing: 5,
        //                       crossAxisSpacing: 10,
        //                     ),
        //                     children: [
        //                       // Container(
        //                       //   margin: const EdgeInsets.symmetric(vertical: 15),
        //                       //   child: Stack(
        //                       //     children: [
        //                       //       Container(
        //                       //         alignment: Alignment.center,
        //                       //         height: 150,
        //                       //         decoration: BoxDecoration(
        //                       //             color: AppColor.primaryColor,
        //                       //             borderRadius:
        //                       //                 BorderRadius.circular(20)),
        //                       //         child: const ListTile(
        //                       //           title: Text("A summer surprise",
        //                       //               style: TextStyle(
        //                       //                   color: Colors.white,
        //                       //                   fontSize: 20)),
        //                       //           subtitle: Text("Cashback 20%",
        //                       //               style: TextStyle(
        //                       //                   color: Colors.white,
        //                       //                   fontSize: 30)),
        //                       //         ),
        //                       //       ),
        //                       //       Positioned(
        //                       //         top: -20,
        //                       //         right: -20,
        //                       //         child: Container(
        //                       //           height: 160,
        //                       //           width: 160,
        //                       //           decoration: BoxDecoration(
        //                       //               color: Colors.blue,
        //                       //               borderRadius:
        //                       //                   BorderRadius.circular(160)),
        //                       //         ),
        //                       //       ),
        //                       //     ],
        //                       //   ),
        //                       // ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Level',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.level);
        //                           print('level');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'User Info',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.userInfo);
        //                           print('user info');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'All Exercise Complete',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.allExerciseComplete);
        //                           print('All Exercise Complete');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Target Weight',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.targetWeight);
        //                           print('Target weight');
        //                         },
        //                       ),
        //                       // CustomButtonAuth(
        //                       //   color: AppColor.blueColor,
        //                       //   text: 'All Favorites',
        //                       //   onPressed: () {
        //                       //     Get.toNamed(AppRoutes.getAllFavorites);
        //                       //     print('All Favorites');
        //                       //   },
        //                       // ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'All Coaches',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.getAllCoaches);
        //                           print('All Coaches');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'All Challenge with Completed Challenge',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.getAllChallenges);
        //                           print('All Challenge');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Plan to Build Muscles',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.getAllWeeksBuild);
        //                           print('plan to build muscles');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Plan to Loss Weight',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.getAllWeeksLoss);
        //                           print('plan to loss weight');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Store',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.storeCategory);
        //                           print('store');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Chat With GPT',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.chat);
        //                           print('chat');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Edit Your Information',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.calories);
        //                           print('Edit Your Information');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Report Progress',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.reportProgress);
        //                           print('Report');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Report Store',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.reportStore);
        //                           print('Report');
        //                         },
        //                       ),
        //                       CustomButtonAuth(
        //                         color: AppColor.primaryColor,
        //                         text: 'Report Exercise',
        //                         onPressed: () {
        //                           Get.toNamed(AppRoutes.reportExercise);
        //                           print('Report');
        //                         },
        //                       ),
        //                       const SizedBox(
        //                         height: 30,
        //                       ),
        //                       CustomButtonAuth(
        //                         text: 'log out',
        //                         color: AppColor.redColor,
        //                         onPressed: () {
        //                           Get.defaultDialog(
        //                             title: 'Logout',
        //                             middleText: 'Sure Want Logout ?',
        //                             onConfirm: () {
        //                               Get.offAllNamed(AppRoutes.login);
        //                               controllerBody.logOut();
        //                               Get.snackbar(
        //                                 'Log Out',
        //                                 'Logging out',
        //                               );
        //                               print('log out');
        //                             },
        //                             onCancel: () {
        //                               Get.back();
        //                             },
        //                             cancelTextColor: AppColor.blackColor,
        //                             confirmTextColor: AppColor.blackColor,
        //                           );
        //                         },
        //                       ),
        //                     ],
        //                   ),
        //           ),

        //           // Container(
        //           //   margin: const EdgeInsets.all(15),
        //           //   padding: const EdgeInsets.all(10),
        //           //   color: Colors.black,
        //           //   width: 50,
        //           //   height: 50,
        //           //   child: Center(
        //           //     child: GestureDetector(
        //           //       child: const Text(
        //           //         'log out',
        //           //         style: TextStyle(color: Colors.white),
        //           //       ),
        //           //       onTap: () {
        //           //         controller.logOut();
        //           //       },
        //           //     ),
        //           //   ),
        //           // ),

        //           //Text('name  ${controller.userName}'),
        //           //Text('email  ${controller.userEmail}'),
        //         ],
        //       ),
        // ),
        // ),
        // ),
      ),
    );
  }
}
