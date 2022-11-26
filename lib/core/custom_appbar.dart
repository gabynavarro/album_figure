import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromRGBO(21, 21, 21, 1),
      elevation: 10.0,
      shadowColor: const Color.fromARGB(255, 42, 42, 43),
      title: Row(
        children: const <Widget>[
          Image(
            width: 70.0,
            height: 40.0,
            image: AssetImage("assets/img/logo.png"),
          ),
          Expanded(
            child: Image(
              width: 30.0,
              height: 40.0,
              image: AssetImage("assets/img/title.png"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
