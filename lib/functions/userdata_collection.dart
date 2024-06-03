import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataController {
  final fn = NetworkFirebaseService();

  void getUserData(String id, BuildContext context) {
    final provider = Provider.of<UserViewModel>(context, listen: false);
    try {
      final snapshot = fn.get(maindata.apis.userdoc(id))
          as DocumentSnapshot<Map<String, dynamic>>;

      UserModel data = UserModel.fromjson(snapshot.data()!);
      provider.setUserData(data);
    } catch (e) {
      rethrow;
    }
  }

  void updateUserData(String id, Map<String, dynamic> data) {
    try {
      fn.update(maindata.apis.userdoc(id), data);
    } catch (e) {
      rethrow;
    }
  }
}
