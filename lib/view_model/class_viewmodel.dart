import 'dart:async';

import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/repository/class_repository.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ClassViewModel extends ChangeNotifier {
  final _repository = ClassRepository();
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

  //   Set
  Future<void> setClass(
      {required ClassModel model, required BuildContext context}) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final data = await _repository.setClass(model: model);
      _classdata.add(data);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  // Get
  Future<void> getClass(BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    final courseData =
        Provider.of<CourseViewModel>(context, listen: false).coursedata;
    try {
      final List<ClassModel> data = await _repository.getClass(
          checkIsStudent: UserModel.checkIsStudent(context), model: courseData);
      _classdata = data;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }
}
