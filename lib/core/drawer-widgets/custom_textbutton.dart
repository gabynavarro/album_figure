import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.text })
      : super(key: key);

      final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text(text),
          leading: Icon(Icons.heart_broken),
          onTap: (() {}),
          );
  }
}