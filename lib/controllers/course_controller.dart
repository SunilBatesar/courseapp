import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/class_controller.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  List<CourseModel> _coursedata = [];
  List<CourseModel> get coursedata => _coursedata;
  setCourseData(List<CourseModel> model) {
    _coursedata = model;
    update();
  }

  addCourseData(CourseModel model) {
    _coursedata.add(model);
    update();
  }

  // SET COURSE FUNCTION
  Future<void> setCourse(CourseModel model) async {
    // SET LOADING
    final loading = Get.find<BoolSetter>();
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
        // GET TO NEXT SCREEN (ADD CLASS SCREEN) AND (ARGUMENTS : COURSE ID)
        Get.toNamed(RouteName.addClassScreen,
            arguments: {"courseid": reference.id});
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
      //  SET LOADING (FALSE)
      loading.setloading(false);
    }
  }

  // GET COURSES DATA FUNCTION
  Future<void> getCourses() async {
    // CLASS CONTROLLER CALL
    final classprovider = Get.find<ClassController>();
    // USER CONTROLLER CALL
    final userprovider = Get.find<UserController>();
    // SET LOADING
    final loading = Get.find<BoolSetter>();
    loading.setloading(true);
    try {
      // CALL FILTERDATA FUNCTION AND SAVE SNAPSHOT
      final QuerySnapshot<Map<String, dynamic>> snapshot = await filterdata(
          checkIsStudent: UserModel.checkIsStudent(),
          userid: userprovider.userdata.data!.uid);
      if (snapshot.docs.isNotEmpty) {
        // COURSES DATA CONVERT TO COURSEMODEL AND SAVE DATA
        final data =
            snapshot.docs.map((e) => CourseModel.fromjson(e.data())).toList();
        // SAVE COURSES DATA CONTROLLER
        _coursedata = data;
        // GET CLASS (CALL GETCLASS FUNCTION)
        await classprovider.getClass(model: data);
      }
    } catch (e) {
      print("-----Get Courses Function ERROR------");
      print(e.toString());
      print("-----Get Courses Function ERROR------");
    } finally {
      update();
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

//  Filter Data
  String _homeFilterData = LocalData.filterlist.first["type"];
  String get homeFilterData => _homeFilterData;

  setHomeFilterData(String value) {
    _homeFilterData = value;
    update();
  }

  // Search On Changed
  String _searchOnchanged = "";
  String get searchOnchanged => _searchOnchanged;

  setSearchOnchanged(String value) {
    _searchOnchanged = value;
    update();
  }

  List<CourseModel> _searchfilterdataList = [];
  List<CourseModel> get searchfilterdataList => _searchfilterdataList;

  Future setSearchfilterdataList() async {
    final q = _coursedata
        .where((element) =>
            element.coursetype!.toLowerCase() == _homeFilterData.toLowerCase())
        .toList();
    _searchfilterdataList = searchOnchanged.isEmpty
        ? q
        : q
            .where((e) => e.name!
                .toLowerCase()
                .trim()
                .contains(searchOnchanged.toLowerCase().trim()))
            .toList();
    update();
  }
}
