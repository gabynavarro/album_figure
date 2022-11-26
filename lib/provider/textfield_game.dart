import 'package:flutter/material.dart';

class TextFieldGame with ChangeNotifier {
  String _textfiel = "ingrese codigo".toUpperCase();

  get getTextFieldGame {
    return _textfiel;
  }

  set setTextFieldGame(String textfiel) {
    this._textfiel = textfiel;

    notifyListeners();
  }
}
