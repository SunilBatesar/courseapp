import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  // CALL FirebaseFirestore (_firstore)
  final FirebaseFirestore _firstore = FirebaseFirestore.instance;
  // ALL Collection Reference
  //  User Collection
  CollectionReference<Map<String, dynamic>> get userReference =>
      _firstore.collection("user");
  //  Courses Collection
  CollectionReference<Map<String, dynamic>> get coursesReference =>
      _firstore.collection("courses");
  //  Class Collection
  CollectionReference<Map<String, dynamic>> get   classReference =>
      _firstore.collection("class");

  // ALL Document Reference
  //  User Collection Doc
  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      userReference.doc(id);
  //  Courses Collection Doc
  DocumentReference<Map<String, dynamic>> coursesdoc(String? id) =>
      coursesReference.doc(id);
  //  Class Collection Doc
  DocumentReference<Map<String, dynamic>> classdoc(String? id) =>
      classReference.doc(id);
}
