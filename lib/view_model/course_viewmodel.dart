import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseViewModel extends ChangeNotifier {
  final _service = NetworkFirebaseService();

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

  //   Set Data
  Future<void> setCoursesDataFirebase(
      CourseModel model, BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final DocumentReference<Map<String, dynamic>> reference =
          await _service.post(maindata.apis.coursesReference, model.tomap());
      if (reference.id.isNotEmpty) {
        _coursedata.add(model.copyWith(id: reference.id));
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  // Get Data
  Future<void> getCoursesDataFirestore(BuildContext context) async {
    final userProvider = Provider.of<UserViewModel>(context, listen: false);
    final coursesProvider =
        Provider.of<CourseViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _getFilterAndAllCourse(userProvider, context);
      if (snapshot.docs.isNotEmpty) {
        final List<CourseModel> data =
            snapshot.docs.map((e) => CourseModel.fromjson(e.data())).toList();
        coursesProvider.setCourseData(data);
        // _coursedata = data;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }

//   Filter And All
  Future<QuerySnapshot<Map<String, dynamic>>> _getFilterAndAllCourse(
      UserViewModel usedata, BuildContext context) async {
    QuerySnapshot<Map<String, dynamic>>? snapshot;
    try {
      if (UserModel.checkIsStudent(context)) {
        snapshot = await _service.get(maindata.apis.coursesReference);
      } else {
        snapshot = await _service.get(maindata.apis.coursesReference
            .where('userid', isEqualTo: usedata.userdata.uid));
      }
    } catch (e) {
      print(e.toString());
    }
    return snapshot!;
  }
}
