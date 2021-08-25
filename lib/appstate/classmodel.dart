import 'package:flutter/material.dart';

class ClassModel extends ChangeNotifier {
  bool _logged = false;

  bool get logged => _logged;

  void setLogged(bool newstate) {
    _logged = newstate;
    notifyListeners();
  }
}
