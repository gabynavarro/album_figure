import 'package:album_figu/provider/info_game.dart';
import 'package:album_figu/provider/textfield_game.dart';
import 'package:album_figu/service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameHead extends StatelessWidget {
  GameHead({super.key});

  final List<String> codeLove = [
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
  ];
  List<String> found = [];
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> econtrada = [];
    String title, msj;

    final textFieldValue = Provider.of<TextFieldGame>(context);
    final infoFound = Provider.of<InfoGame>(context);

    LocalStorage.prefs.getStringList('listLove') == null
        ? LocalStorage.prefs.setStringList("listLove", <String>[])
        : LocalStorage.prefs.setStringList("listLove",
            econtrada = LocalStorage.prefs.getStringList("listLove")!);
    infoFound.setInfoGame = econtrada;
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
      child: Column(
        children: [
          _head(),
          const SizedBox(
            height: 20.0,
          ),
          _textField(textFieldValue),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 10.0, bottom: 10),
              shadowColor: Colors.black,
            ),
            child: const Text("BUSCAR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              //funcoion que gurada en memoria las contradas
              String text = codeController.text;

              textFieldValue.setTextFieldGame = "ESCRIBE EL CODIGO";
              //logica de busqueda
              if (codeLove.contains(text) &&
                  !econtrada.contains('${codeLove.indexOf(text)}')) {
                found = econtrada;
                found.add("${codeLove.indexOf(text)}");
                LocalStorage.prefs.setStringList('listLove', found);
                title = "Código correcto";
                msj =
                    "Desbloqueaste un código correcto, que representa un un amor verdadero";
                myShowDialog(context, title, msj);
              } else {
                //    LocalStorage.prefs.remove("listLove");
                title = "Error";
                msj =
                    "El código ya fue desbloqueado o ingresaste un código incorrectos";
                myShowDialog(context, title, msj);
              }
            },
          )),
        ],
      ),
    );
  }

  Future<dynamic> myShowDialog(BuildContext context, String title, String msj) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("$title"),
              content: Text("$msj"),
              actions: [
                TextButton(
                  child: Text("Aceptar"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }

  Row _head() {
    return Row(
      children: const <Widget>[
        Icon(
          Icons.pin_drop,
          color: Colors.black,
          size: 30.0,
        ),
        SizedBox(width: 10.0),
        Text(
          "Juego.",
          style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  TextField _textField(TextFieldGame textFieldValue) {
    return TextField(
      autofocus: true,
      controller: codeController,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        hintText: textFieldValue.getTextFieldGame,
        hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black38),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(21, 21, 21, 1), width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(21, 21, 21, 1), width: 2.0),
        ),
      ),
    );
  }
}
