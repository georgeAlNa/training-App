import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';

class DiscountImage extends StatelessWidget {
  const DiscountImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 400,
      height: 170,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            AppImageAsset.discount,
          ),
          fit: BoxFit.fill,
        ),
        color: AppColor.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const ListTile(
        title: Text(
          "A Summer Surprise ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "   Discount 20%",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
