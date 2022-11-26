import 'package:flutter/material.dart';

class CloseDrawerButton extends StatelessWidget {
  const CloseDrawerButton({Key? key, this.isEndDrawer = false})
      : super(key: key);

  final bool isEndDrawer;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(right: 20),
      alignment: isEndDrawer ? Alignment.centerLeft : Alignment.centerRight,
      height: size.width * .2,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      );
  }
}