import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';

class ClassRepository {
  //  Set
  Future<ClassModel> setClass({required ClassModel model}) async {
    ClassModel? data;
    try {
      // Post Class Data
      final DocumentReference<Map<String, dynamic>> reference = await maindata
          .networkFirebaseService
          .post(maindata.apis.classReference, model.tomap());
      if (reference.id.isNotEmpty) {
        // Class Id Add(Update) Collection
        maindata.networkFirebaseService
            .update(maindata.apis.classdoc(reference.id), {"id": reference.id});
        // Return Class Model
        data = model.copyWith(id: reference.id);
      }
    } catch (e) {
      rethrow;
    }
    return data!;
  }

  // Get
  Future<List<ClassModel>> getClass(
      {required bool checkIsStudent, required List<CourseModel> model}) async {
    List<ClassModel>? data;
    try {
      final snapshot =
          await filterdata(checkIsStudent: checkIsStudent, model: model);
      if (snapshot.docs.isNotEmpty) {
        final List<ClassModel> classData =
            snapshot.docs.map((e) => ClassModel.fromjson(e.data())).toList();
        data = classData;
      }
    } catch (e) {
      rethrow;
    }
    return data!;
  }

  // Filter Class
  Future<QuerySnapshot<Map<String, dynamic>>> filterdata(
      {required bool checkIsStudent, required List<CourseModel> model}) async {
    QuerySnapshot<Map<String, dynamic>>? snapshot;
    try {
      if (checkIsStudent) {
        snapshot = await maindata.networkFirebaseService
            .get(maindata.apis.classReference);
      } else {
        for (var course in model) {
          snapshot = await maindata.networkFirebaseService.get(maindata
              .apis.classReference
              .where("courseid", isEqualTo: course.id));
        }
      }
    } catch (e) {
      rethrow;
    }
    return snapshot!;
  }
}
