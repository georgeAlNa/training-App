import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';
// import 'package:training_app/core/constant/imageasset.dart';

class CustomButtonCart extends StatelessWidget {
  final String textTitle;
  final String textCost;
  final String textAmount;
  final String textId;
  final String imagePath;
  final Color color;
  final void Function()? onPressed;
  final void Function()? onPressedIconDelete;
  final void Function()? onPressedIconBuy;
  final void Function()? onLongPress;
  const CustomButtonCart({
    Key? key,
    required this.textTitle,
    required this.textCost,
    required this.textAmount,
    required this.textId,
    required this.imagePath,
    required this.color,
    this.onPressed,
    this.onLongPress,
    this.onPressedIconDelete,
    this.onPressedIconBuy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     AppColor.yellowForDesign2,
          //     AppColor.blackColor,
          //   ],
          // ),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          color: AppColor.black54Color,
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColor.black54Color,
                    AppColor.color,
                  ],
                ),
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.fill,
                ),
                color: AppColor.blackColor,
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  color: AppColor.blackColor,
                  width: 3,
                ),
              ),
            ),

            // Image.network(imagePath),
            Text(
              textTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textCost,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textAmount,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textId,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.attach_money_outlined,
                color: AppColor.color,
              ),
              onPressed: onPressedIconBuy,
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: AppColor.redColor,
              ),
              onPressed: onPressedIconDelete,
            ),
          ],
        ),
      ),
    );
  }
}
