import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

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
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(13),
        onPressed: onPressed,
        onLongPress: onLongPress,
        color: color,
        textColor: Colors.white,
        child: Column(
          children: [
            Image.network(imagePath),
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
                color: AppColor.redColor,
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
