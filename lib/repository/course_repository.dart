import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';

class CourseRepository {
  // Set
  Future<CourseModel> setCourseRepo(CourseModel model) async {
    CourseModel? data;
    try {
      // Post Course Data
      final DocumentReference<Map<String, dynamic>> reference = await maindata
          .networkFirebaseService
          .post(maindata.apis.coursesReference, model.tomap());
      String id = reference.id;
      if (id.isNotEmpty) {
        // Course Id Add(Update) Collection
        await maindata.networkFirebaseService
            .update(maindata.apis.coursesdoc(id), {"id": reference.id});
        // Return Course Model
        data = model.copyWith(id: reference.id);
      }
    } catch (e) {
      rethrow;
    }
    return data!;
  }

  // Get
  Future<List<CourseModel>> getCoursesRepo(
      {required bool checkIsStudent, required String userid}) async {
    List<CourseModel>? data;
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await filterdata(checkIsStudent: checkIsStudent, userid: userid);
      if (snapshot.docs.isNotEmpty) {
        data =
            snapshot.docs.map((e) => CourseModel.fromjson(e.data())).toList();
      }
    } catch (e) {
      rethrow;
    }
    return data!;
  }

  // Filter Data
  Future<QuerySnapshot<Map<String, dynamic>>> filterdata(
      {required bool checkIsStudent, required String userid}) async {
    try {
      if (checkIsStudent) {
        return await maindata.networkFirebaseService
            .get(maindata.apis.coursesReference);
      } else {
        return await maindata.networkFirebaseService.get(
            maindata.apis.coursesReference.where("userid", isEqualTo: userid));
      }
    } catch (e) {
      rethrow;
    }
  }
}
