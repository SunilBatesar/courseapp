import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/functions/FirebaseFunctions/firebasefirestore_functions.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthFunction {
  final _auth = FirebaseAuth.instance;
  final _firstore = FirebaseFirestore.instance;

  // CreateUser (SingUp)
  Future singUpUser(
      UserModel model, String password, BuildContext context) async {
    final provider = Provider.of<UserViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final UserCredential usercredential =
          await _auth.createUserWithEmailAndPassword(
              email: model.email!, password: password);
      if (usercredential.user!.uid.isNotEmpty) {
        await FirebaseFirestoreFunction().setUserDataFirestore(
            model.copyWith(uid: usercredential.user!.uid), context);
        provider.setUserData(model.copyWith(uid: usercredential.user!.uid));
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.appBottomNavigationBar,
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      // AppUtils.flushbarBarMessage(e.toString(), context);
    } finally {
      loading.setloading(false);
    }
  }

  //  Login User Function
  Future loginUser(String email, String password, BuildContext context) async {
    final provider = Provider.of<UserViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final snapshot = await _firstore
          .collection("user")
          .where("email", isEqualTo: email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        provider.setUserData(UserModel.fromjson(
            snapshot.docs.first.data(), snapshot.docs.first.id));
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.appBottomNavigationBar,
          (route) => false,
        );
      } else {
        debugPrint("Email wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
      // AppUtils.flushbarBarMessage(e.toString(), context);
    } finally {
      loading.setloading(false);
    }
  }
}
