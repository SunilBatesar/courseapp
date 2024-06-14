import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseFirestoreFunction {
  //  Call FirebaseFirestore
  final _firstore = FirebaseFirestore.instance;

  // User Data Update

  Future<void> userDataUpdateFirestore(
      UserModel model, BuildContext context) async {
    final provider = Provider.of<UserController>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      await _firstore
          .collection("user")
          .doc(model.uid)
          .update(model.tomap())
          .then(
        (value) {
          provider.setUserData(model);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
  }
}
