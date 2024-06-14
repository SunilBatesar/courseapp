import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/class_controller.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CourseController extends ChangeNotifier {
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

  // SET COURSE FUNCTION
  Future<void> setCourse(CourseModel model, BuildContext context) async {
    // SET LOADING
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      // CALL POST FUNCTION AND SAVE REFERENCE
      final DocumentReference<Map<String, dynamic>> reference = await maindata
          .networkFirebaseService
          .post(maindata.apis.coursesReference, model.tomap());
      //  SAVE REFERENCE ID
      String id = reference.id;
      if (id.isNotEmpty) {
        // REFERENCE DATA UPDATE(ADD ID COURSE)
        await maindata.networkFirebaseService
            .update(maindata.apis.coursesdoc(id), {"id": reference.id});
        // SAVE COURSE DATA CONTROLLER
        _coursedata.add(model.copyWith(id: reference.id));
        // PUSH NEXT SCREEN (ADD CLASS SCREEN) AND (ARGUMENTS : COURSE ID)
        Navigator.pushNamed(context, RouteName.addClassScreen,
            arguments: reference.id);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
      //  SET LOADING (FALSE)
      loading.setloading(false);
    }
  }

  // GET COURSES DATA FUNCTION
  Future<void> getCourses(BuildContext context) async {
    // CLASS CONTROLLER CALL
    final classprovider = Provider.of<ClassController>(context, listen: false);
    // CLASS CONTROLLER CALL
    final userprovider = Provider.of<UserController>(context, listen: false);
    // SET LOADING
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      // CALL FILTERDATA FUNCTION AND SAVE SNAPSHOT
      final QuerySnapshot<Map<String, dynamic>> snapshot = await filterdata(
          checkIsStudent: UserModel.checkIsStudent(context),
          userid: userprovider.userdata.uid);
      if (snapshot.docs.isNotEmpty) {
        // COURSES DATA CONVERT TO COURSEMODEL AND SAVE DATA
        final data =
            snapshot.docs.map((e) => CourseModel.fromjson(e.data())).toList();
        // SAVE COURSES DATA CONTROLLER
        _coursedata = data;
        // GET CLASS (CALL GETCLASS FUNCTION)
        await classprovider.getClass(model: data, context: context);
      }
    } catch (e) {
      print("-----------");
      print(e.toString());
      print("-----------");
    } finally {
      notifyListeners();
      // SET LOADING (FALSE)
      loading.setloading(false);
    }
  }

  // FILTER DATA FUNCTION
  Future<QuerySnapshot<Map<String, dynamic>>> filterdata(
      {required bool checkIsStudent, required String userid}) async {
    try {
      // CHECK USER STATE
      if (checkIsStudent) {
        // STUDENT HAI TO ALL COURSES GET
        return await maindata.networkFirebaseService
                .get(maindata.apis.coursesReference)
            as QuerySnapshot<Map<String, dynamic>>;
      } else {
        // TEACHER HAI TO USI KE COURSES GET
        return await maindata.networkFirebaseService.get(maindata
                .apis.coursesReference
                .where("userid", isEqualTo: userid))
            as QuerySnapshot<Map<String, dynamic>>;
      }
    } catch (e) {
      rethrow;
    }
  }
}
