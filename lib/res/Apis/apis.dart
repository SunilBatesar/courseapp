import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  final FirebaseFirestore _firstore = FirebaseFirestore.instance;
  //  User Collection
  CollectionReference<Map<String, dynamic>> get userReference =>
      _firstore.collection("user");
  //  User Collection Doc
  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      userReference.doc(id);

  //  Courses Collection
  CollectionReference<Map<String, dynamic>> get coursesReference =>
      _firstore.collection("courses");
  //  Courses Collection Doc
  DocumentReference<Map<String, dynamic>> coursesdoc(String? id) =>
      coursesReference.doc(id);

  //  Class Collection
  CollectionReference<Map<String, dynamic>> get classReference =>
      _firstore.collection("class");
  //  Class Collection Doc
  DocumentReference<Map<String, dynamic>> classdoc(String? id) =>
      classReference.doc(id);
}
