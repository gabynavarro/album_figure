import 'package:album_figu/core/custom_appbar.dart';
import 'package:album_figu/core/drawer-widgets/custom_drawer.dart';
import 'package:album_figu/features/game_module/components/game_body.dart';
import 'package:album_figu/features/game_module/components/game_information.dart';
import 'package:album_figu/provider/textfield_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/game_head.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthScreem = MediaQuery.of(context).size.width;
    final double heightScreem = MediaQuery.of(context).size.height;
    final textFieldValue = Provider.of<TextFieldGame>(context);

    return Scaffold(
      appBar: const MyAppBar(),
      endDrawer: const CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: heightScreem * .33,
                  width: widthScreem * .9,
                  child: GameHead()),
              Container(
                  alignment: Alignment.center,
                  height: heightScreem * .17,
                  width: widthScreem * .75,
                  child: const GameInformation()),
              Center(
                child: Container(
                    height: heightScreem * .39,
                    width: widthScreem * .9,
                    child: GameBody()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
