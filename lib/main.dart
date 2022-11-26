import 'package:album_figu/features/game_module/screens/game_screen.dart';
import 'package:album_figu/provider/info_game.dart';
import 'package:album_figu/provider/textfield_game.dart';
import 'package:album_figu/service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => InfoGame(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (context) => TextFieldGame(),
            lazy: false,
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Game(),
        ));
  }
}
