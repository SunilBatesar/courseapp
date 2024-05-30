import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  //  Call FirebaseFirestore
  final FirebaseFirestore _firstore = FirebaseFirestore.instance;
  dynamic get usereference => _firstore.collection("user");

  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      usereference.doc(id);
}
