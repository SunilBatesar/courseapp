import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/class_viewmodel.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaincourseViewModel extends ChangeNotifier {
  List<MainCoursesModel> _maincoursedata = [];
  List<MainCoursesModel> get maincoursedata => _maincoursedata;
  setMainCourseData(List<MainCoursesModel> model) {
    _maincoursedata = model;
    notifyListeners();
  }

  addcourseAndclass(BuildContext context) {
    final coursesdata =
        Provider.of<CourseViewModel>(context, listen: false).coursedata;
    final classdata =
        Provider.of<ClassViewModel>(context, listen: false).classdata;
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    final List<MainCoursesModel> alldata = [];
    for (var cours in coursesdata) {
      final CourseModel c = cours;
      final List<ClassModel> cla = classdata
          .where(
            (e) => e.courseid == c.id,
          )
          .toList();
      alldata.add(MainCoursesModel(coursemodel: c, classmodel: cla));
    }
    setMainCourseData(alldata);
    loading.setloading(false);
  }
}
