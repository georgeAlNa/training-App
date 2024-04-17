import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  final void Function(dynamic) onChanged;
  final Color activeColor;
  final Color tileColor;
  final Widget title;
  final dynamic value;
  final dynamic groupValue;
  const CustomRadioListTile(
      {super.key,
      required this.onChanged,
      required this.activeColor,
      required this.tileColor,
      required this.title,
      required this.value,
      required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: activeColor,
      tileColor: tileColor,
      title: title,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
