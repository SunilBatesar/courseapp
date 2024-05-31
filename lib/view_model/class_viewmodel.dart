import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassViewModel extends ChangeNotifier {
  final _service = NetworkFirebaseService();
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
  Future<void> setClassDataFirestore(
      {required ClassModel model, required BuildContext context}) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final DocumentReference<Map<String, dynamic>> reference =
          await _service.post(maindata.apis.classReference, model.tomap());
      if (reference.id.isNotEmpty) {
        _classdata.add(model.copyWith(id: reference.id));
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  //  Get

  Future<void> getClassDataFirebase(BuildContext context) async {
    final classprovider = Provider.of<ClassViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _getFilterAndAllClass(context);
      if (snapshot.docs.isNotEmpty) {
        List<ClassModel> data =
            snapshot.docs.map((e) => ClassModel.fromjson(e.data())).toList();
        classprovider.setclassData(data);
        // _classdata = data;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getFilterAndAllClass(
      BuildContext context) async {
    final courses =
        Provider.of<CourseViewModel>(context, listen: false).coursedata;
    QuerySnapshot<Map<String, dynamic>>? snapshot;
    try {
      if (UserModel.checkIsStudent(context)) {
        snapshot = await _service.get(maindata.apis.classReference);
      } else {
        for (var course in courses) {
          snapshot = await _service.get(maindata.apis.classReference
              .where("courseid", isEqualTo: course.id));
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return snapshot!;
  }
}
