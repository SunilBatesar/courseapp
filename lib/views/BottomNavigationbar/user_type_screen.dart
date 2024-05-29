import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/views/course_screens/add_course_screen.dart';
import 'package:courses_app/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UserModel.checkIsStudent(context)
        ? const HomeScreen()
        : const AddCourseScreen();
  }
}
