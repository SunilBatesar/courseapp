import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  final FirebaseFirestore _firstore = FirebaseFirestore.instance;
  //  Call FirebaseFirestore
// 
  dynamic get usereference => _firstore.collection("user");

  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      usereference.doc(id);
}
