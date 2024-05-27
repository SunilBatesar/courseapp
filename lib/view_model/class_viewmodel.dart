import 'package:courses_app/model/all_model.dart';
import 'package:flutter/material.dart';

class ClassViewmodel extends ChangeNotifier {
  List<ClassModel> _classdata = [];
  List<ClassModel> get classdata => _classdata;
  setclassData(List<ClassModel> model) {
    _classdata = model;
    notifyListeners();
  }

  addclassData(ClassModel model) {
    _classdata.add(model);
    notifyListeners();
  }
}
