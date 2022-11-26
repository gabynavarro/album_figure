import 'package:flutter/material.dart';

class InfoGame with ChangeNotifier {
  List<String> _listAmor = [];

  get getInfoGame {
    return _listAmor;
  }

  set setInfoGame(List<String> listAmor) {
    this._listAmor = listAmor;
  }

  void add(String item) {
    _listAmor.add(item);
    notifyListeners();
  }
}
