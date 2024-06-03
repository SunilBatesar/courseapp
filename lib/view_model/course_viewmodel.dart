import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/repository/course_repository.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  Future<String> setCourse(
      {required CourseModel model, required BuildContext context}) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    String? id;
    try {
      final CourseModel data = await _repository.setCourseRepo(model);
      id = data.id;
      _coursedata.add(data);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
    return id!;
  }

  // Get Data
  Future<void> getCourses(BuildContext context) async {
    final user = Provider.of<UserViewModel>(context, listen: false).userdata;
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final List<CourseModel> data = await _repository.getCoursesRepo(
          checkIsStudent: UserModel.checkIsStudent(context), userid: user.uid!);
      _coursedata = data;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }
}
