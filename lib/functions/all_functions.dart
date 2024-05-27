// import 'package:courses_app/model/all_model.dart';
// import 'package:courses_app/repository/course_repository.dart';
// import 'package:courses_app/view_model/boolsetter.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AllFuntions {
  // final _courseRepository = CourseRepository();
  // Future getCourseData(BuildContext context) async {
  //   // final provider = Provider.of<CourseViewModel>(context, listen: false);
  //   final loading = Provider.of<BoolSetter>(context, listen: false);
  //   loading.setloading(true);
  //   final data = await _courseRepository.courseApi() as List;
  //   final List<CourseModel> allData =
  //       data.map((e) => CourseModel.fromjson(e)).toList();
  //   loading.setloading(false);
  //   // provider.setCourseData(allData);
  // }
// }
