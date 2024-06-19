import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/class_controller.dart';
import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:get/get.dart';

class AppInitialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(CourseController());
    Get.put(ClassController());
    Get.put(BoolSetter());
  }
}
