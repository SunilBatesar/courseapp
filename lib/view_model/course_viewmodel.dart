import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/repository/course_repository.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseViewModel extends ChangeNotifier {
  final _repository = CourseRepository();

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

  // Set Data
  Future<void> setCourse({required CourseModel model}) async {
    try {
      final CourseModel data = await _repository.setCourseRepo(model);
      _coursedata.add(data);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  // Get Data
  Future<void> getCourses(BuildContext context) async {
    final user = Provider.of<UserViewModel>(context, listen: false).userdata;
    try {
      final List<CourseModel> data = await _repository.getCoursesRepo(
          checkIsStudent: UserModel.checkIsStudent(context), userid: user.uid!);
      _coursedata = data;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  // Get Data
  // Future<void> getCoursesDataFirestore(BuildContext context) async {
  //   final userProvider = Provider.of<UserViewModel>(context, listen: false);
  //   final coursesProvider =
  //       Provider.of<CourseViewModel>(context, listen: false);
  //   final loading = Provider.of<BoolSetter>(context, listen: false);
  //   loading.setloading(true);
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> snapshot =
  //         await _getFilterAndAllCourse(userProvider, context);
  //     if (snapshot.docs.isNotEmpty) {
  //       final List<CourseModel> data =
  //           snapshot.docs.map((e) => CourseModel.fromjson(e.data())).toList();
  //       coursesProvider.setCourseData(data);
  //       // _coursedata = data;
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

//   Filter And All
  // Future<QuerySnapshot<Map<String, dynamic>>> _getFilterAndAllCourse(
  //     UserViewModel usedata, BuildContext context) async {
  //   QuerySnapshot<Map<String, dynamic>>? snapshot;
  //   try {
  //     if (UserModel.checkIsStudent(context)) {
  //       snapshot = await _service.get(maindata.apis.coursesReference);
  //     } else {
  //       snapshot = await _service.get(maindata.apis.coursesReference
  //           .where('userid', isEqualTo: usedata.userdata.uid));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return snapshot!;
  // }
}
