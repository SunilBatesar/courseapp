import 'package:courses_app/model/all_model.dart';
import 'package:flutter/material.dart';

class CourseViewModel extends ChangeNotifier {
  List<CourseModel> _coursedata = [];
  List<CourseModel> get coursedata => _coursedata;
  setCourseData(List<CourseModel> model) {
    _coursedata = model;
    notifyListeners();
  }
  addCourseData(CourseModel model) {
    _coursedata.add(model);
    notifyListeners();
  }
}
