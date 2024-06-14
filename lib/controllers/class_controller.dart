import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ClassController extends ChangeNotifier {
  // PRIVATE CLASS DATA
  List<ClassModel> _classdata = [];
  // GET CLASS ALL DATA
  List<ClassModel> get classdata => _classdata;

  //  SET CLASS DATA FUNCTION
  Future<void> setClass(
      {required ClassModel model, required BuildContext context}) async {
    // LODING SET
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      // CALL POST FUNCTION AND GET REFERENCE
      final DocumentReference<Map<String, dynamic>> reference = await maindata
          .networkFirebaseService
          .post(maindata.apis.classReference, model.tomap());
      if (reference.id.isNotEmpty) {
        // CLASS ID UPDATE (ADD) DOCUMENT DATA ("id":reference.id)
        await maindata.networkFirebaseService
            .update(maindata.apis.classdoc(reference.id), {"id": reference.id});
        // SAVE CLASS DATA CONTROLLER
        _classdata.add(model.copyWith(id: reference.id));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
      // SET LOADING (FALSE)
      loading.setloading(false);
    }
  }

  // GET CLASS DATA FUNCTION
  Future<void> getClass(
      {required List<CourseModel> model, required BuildContext context}) async {
    // LODING SET
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      //  FILTERDATA FUNCTION CALL AND DATA GET
      final snapshot = await filterdata(
          checkIsStudent: UserModel.checkIsStudent(context), model: model);
      if (snapshot.docs.isNotEmpty) {
        // CONVERT CLASS DATA TO CLASSMODEL AND SAVE CLASSDATA
        final List<ClassModel> classData =
            snapshot.docs.map((e) => ClassModel.fromjson(e.data())).toList();
        // SAVE CLASS DATA CONTROLLER
        _classdata = classData;
      }
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
      // SET LOADIND (FALSE)
      loading.setloading(false);
    }
  }

  // FILTERDATA CLASS FUNCTION
  Future<QuerySnapshot<Map<String, dynamic>>> filterdata(
      {required bool checkIsStudent, required List<CourseModel> model}) async {
    // SAVE SNAPSHOT
    QuerySnapshot<Map<String, dynamic>>? snapshot;
    try {
      // CHECK USER STATE
      if (checkIsStudent) {
        // STUDENT HAI TO ALL CLASS GET
        snapshot = await maindata.networkFirebaseService
                .get(maindata.apis.classReference)
            as QuerySnapshot<Map<String, dynamic>>;
      } else {
        //  TEACHER HAI TO USI KE COURSE KI CLASS GET
        for (var course in model) {
          snapshot = await maindata.networkFirebaseService.get(maindata
                  .apis.classReference
                  .where("courseid", isEqualTo: course.id))
              as QuerySnapshot<Map<String, dynamic>>;
        }
      }
    } catch (e) {
      rethrow;
    }
    // RETURN SNAPSHOT
    return snapshot!;
  }
}
