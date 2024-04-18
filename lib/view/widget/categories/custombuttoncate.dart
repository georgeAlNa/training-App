import 'package:flutter/material.dart';

class CustomButtonCategory extends StatelessWidget {
  final String text;
  final String? pathImage;
  final Color color;
  final void Function()? onPressed;

  const CustomButtonCategory(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.color,
      this.pathImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            pathImage!,
            width: 10,
            height: 20,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 13),
            onPressed: onPressed,
            color: color,
            textColor: Colors.white,
            child: Text(text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
