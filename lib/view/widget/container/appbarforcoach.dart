import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class AppBarCoach extends StatelessWidget {
  final String title;
  final Widget body;
  final void Function() onPressed;

  const AppBarCoach({
    super.key,
    required this.title,
    required this.body,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        leading: const CircleAvatar(
          radius: 5,
          backgroundImage: AssetImage(
            "assets/images/logo.png",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              color: AppColor.redColor,
            ),
            iconSize: 30,
            onPressed: onPressed,
          ),
        ],
      ),
      body: body,
    );
  }
}
