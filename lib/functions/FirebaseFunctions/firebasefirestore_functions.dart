import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/response/data_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseFirestoreFunction {
  //  Call FirebaseFirestore
  final _firstore = FirebaseFirestore.instance;

  // User Data Update

  Future<void> userDataUpdateFirestore(
      UserModel model, BuildContext context) async {
    final provider = Get.find<UserController>();
    final loading = Get.find<BoolSetter>();
    loading.setloading(true);
    try {
      await _firstore
          .collection("user")
          .doc(model.uid)
          .update(model.tomap())
          .then(
        (value) {
          provider.setUserData(DataResponse.completed(model));
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
  }
}
