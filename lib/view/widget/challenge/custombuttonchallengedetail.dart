import 'package:flutter/material.dart';

class CustomButtonChallengeDetail extends StatelessWidget {
  final String textTitle;
  final String textSubject;
  final String textDate;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonChallengeDetail(
      {Key? key,
      required this.textTitle,
      this.onPressed,
      required this.color,
      required this.textSubject,
      required this.textDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(13),
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Column(
          children: [
            Text(
              textTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textSubject,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              textDate,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
