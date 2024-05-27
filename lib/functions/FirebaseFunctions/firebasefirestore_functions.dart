// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/class_viewmodel.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Profession {
  Student,
  Teacher;
}

class FirebaseFirestoreFunction {
  //  Call FirebaseFirestore
  final _firstore = FirebaseFirestore.instance;

  // Set User Firestore
  Future setUserDataFirestore(UserModel model, BuildContext context) async {
    final provider = Provider.of<UserViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final DocumentReference<Map<String, dynamic>> reference =
          await _firstore.collection("user").add(model.tomap());
      if (reference.id.isNotEmpty) {
        provider.setUserData(UserModel.fromjson(model.tomap(), reference.id));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  // Get User Data
  Future getUserData(String uid, BuildContext context) async {
    final provider = Provider.of<UserViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firstore.collection("user").doc(uid).get();
      if (snapshot.exists) {
        final UserModel data = UserModel.fromjson(snapshot.data()!, uid);
        provider.setUserData(data);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  // Set Courses Firestore
  Future<String> setCourseDataFirestore(
      CourseModel model, BuildContext context) async {
    final provider = Provider.of<CourseViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    String coureseid = "";
    loading.setloading(true);

    try {
      final DocumentReference<Map<String, dynamic>> reference =
          await _firstore.collection("courses").add(model.tomap());
      if (reference.id.isNotEmpty) {
        provider
            .addCourseData(CourseModel.fromjson(model.tomap(), reference.id));
        coureseid = reference.id;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
    return coureseid;
  }

  // Get Courses Data
  Future getCoursesDataFirestore(BuildContext context) async {
    final provider = Provider.of<CourseViewModel>(context, listen: false);
    final userProvider = Provider.of<UserViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      var ref = _firstore.collection("courses");
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          UserModel.checkIsStudent(context)
              ? await ref
                  .where('userid', isEqualTo: userProvider.userdata.profession)
                  .get()
              : await ref.get();
      if (snapshot.docs.isNotEmpty) {
        final List<CourseModel> data = snapshot.docs
            .map((e) => CourseModel.fromjson(e.data(), e.id))
            .toList();
        provider.setCourseData(data);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  // Set Class Firestore
  Future setClassDataFirestore(ClassModel model, BuildContext context) async {
    final provider = Provider.of<ClassViewmodel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final DocumentReference<Map<String, dynamic>> reference =
          await _firstore.collection("class").add(model.tomap());
      if (reference.id.isNotEmpty) {
        provider.addclassData(ClassModel.fromjson(model.tomap(), reference.id));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  // Get Class Data
  Future getClassDataFirestore(BuildContext context) async {
    final provider = Provider.of<ClassViewmodel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firstore.collection("class").get();
      if (snapshot.docs.isNotEmpty) {
        final List<ClassModel> data = snapshot.docs
            .map((e) => ClassModel.fromjson(e.data(), e.id))
            .toList();
        provider.setclassData(data);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
  }
}
