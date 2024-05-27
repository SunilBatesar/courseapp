// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:courses_app/data/network/baseapi_service.dart';
// import 'package:flutter/material.dart';

// class NetworkFirebaseService extends FirebaseService {
//   //  Call FirebaseFirestore
//   final _firstore = FirebaseFirestore.instance;
//   @override
//   Future<QuerySnapshot<Map<String, dynamic>>> getFirebaseResponse(
//       String collection) async {
//     QuerySnapshot<Map<String, dynamic>>? snapshot;
//     try {
//       final QuerySnapshot<Map<String, dynamic>> data =
//           await _firstore.collection(collection).get();
//       snapshot = data;
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return snapshot!;
//   }

//   @override
//   Future setFirebaseResponse(String collection) async {}
// }
