import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoolSetter extends GetxController {
  // Loading
  bool _loading = false;

  // Loading get
  bool get loading => _loading;

  // Loading set
  setloading(bool value) {
    _loading = value;
    update();
  }
}
