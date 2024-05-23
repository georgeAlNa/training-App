import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

// ignore: must_be_immutable
class CustomButtonCategory extends StatelessWidget {
  final void Function()? onTap;
  final String imagePath;
  final String categoryName;
  const CustomButtonCategory({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 3,
        ),
        InkWell(
          onTap: onTap,
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 170,
                    width: 408,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    color: AppColor.blackColor,
                    child: Center(
                      child: Text(
                        categoryName,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.yellow100Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
