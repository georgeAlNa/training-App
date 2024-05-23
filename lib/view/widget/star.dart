import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  const Star({super.key});

  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> {
  bool isButtonPressed = false;

  void onPressed() {
    setState(() {
      isButtonPressed = !isButtonPressed;
      // Get.to(Rate());
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.star,
          size: 50, color: isButtonPressed ? Colors.white : Colors.blue),
      onPressed: onPressed,
    );
  }
}
