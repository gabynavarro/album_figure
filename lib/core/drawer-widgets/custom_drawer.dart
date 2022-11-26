import 'package:album_figu/core/drawer-widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'custom_closebtndrawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          CloseDrawerButton(),
          Text(
            'Filtros',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
          CustomTextButton(
            text: 'TODOS',
          ),
          SizedBox(height: 6),
          CustomTextButton(text: 'ACTIVACIONES'),
          SizedBox(height: 6),
          CustomTextButton(text: 'OBRAS'),
          SizedBox(height: 6),
          CustomTextButton(text: 'SABOR AMOR. Menús'),
          SizedBox(height: 6),
          CustomTextButton(text: 'VINOLOVE. Degustacion'),
          SizedBox(height: 6),
          CustomTextButton(text: 'INFORMACIÓN'),
          SizedBox(height: 6),
          CustomTextButton(text: 'PUNTO BESO'),
          SizedBox(height: 30),
          Text(
            'Refes',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
