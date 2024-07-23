import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/constant/routes_name.dart';

class AppBarCoach extends StatelessWidget {
  final String title;
  final Widget body;
  final void Function() onPressed;
  final void Function() onPressedIconRefresh;

  AppBarCoach({
    super.key,
    required this.title,
    required this.body,
    required this.onPressed,
    required this.onPressedIconRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.more_horiz,
                color: AppColor.blackColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 20,
                offset: Offset(1, 1),
                color: AppColor.greyColor,
              ),
            ],
          ),
        ),
        backgroundColor: AppColor.color,
        // leading: const CircleAvatar(
        //   radius: 5,
        //   backgroundImage: AssetImage(
        //     "assets/images/logo.png",
        //   ),
        // ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              color: AppColor.redColor,
            ),
            iconSize: 30,
            onPressed: onPressed,
          ),
          IconButton(
            onPressed: onPressedIconRefresh,
            icon: const Icon(
              Icons.refresh,
              color: AppColor.redColor,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              curve: Curves.bounceInOut,
              decoration: BoxDecoration(
                  // color: AppColor.blackColor,
                  ),
              child: CircleAvatar(
                radius: 5,
                backgroundImage: AssetImage(
                  AppImageAsset.logo,
                ),
              ),
              // Center(
              //   child: Text(
              //     'Welcome Coach ....',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 25,
              //     ),
              //   ),
              // ),
            ),
            ListTile(
              leading: const Icon(
                Icons.done,
              ),
              title: const Text('All Exercises Trainer Complete'),
              onTap: () {
                Get.toNamed(AppRoutes.allExerciseCompleteByUserId);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.inbox,
              ),
              title: const Text('Inbox'),
              onTap: () {
                Get.toNamed(AppRoutes.allAdviceRequestByCoach);
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
