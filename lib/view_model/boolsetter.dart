import 'package:flutter/material.dart';

class BoolSetter extends ChangeNotifier {
  // Loading
  bool _loading = false;

  // Loading get
  bool get loading => _loading;

  // Loading set
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
