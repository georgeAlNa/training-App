import 'package:flutter/material.dart';

class CustomButtonOrderInCart extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  const CustomButtonOrderInCart(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.color,
      this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        onLongPress: onLongPress,
        color: color,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
