import 'package:courses_app/controllers/user_controller.dart';
import 'package:get/get.dart';

class AppInitialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());

  }
  
}