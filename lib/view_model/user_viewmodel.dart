import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/Preferences/sharedpreferences.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/repository/user_repository.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserViewModel extends ChangeNotifier {
  // Call Network Firebase Service
  final _service = NetworkFirebaseService();
  // Call User Repository
  final _repository = UserRepository();
  dynamic _userdata;
  // Get User Data
  UserModel get userdata => _userdata;
  //  Set user Data
  setUserData(UserModel model) {
    _userdata = model;
    notifyListeners();
  }

  Future<void> signUpFirebase(
      {required UserModel model,
      required String password,
      required BuildContext context}) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final user = await _repository.setUser(model: model, password: password);
      await SPref.setSharedPrefs(SPref.userIDKey, user.uid);
      _userdata = user;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  //  User Data Get In FirebaseFirestore (Use User ID)
  Future<void> getUserDataFirebase(String id, BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _service.get(maindata.apis.userdoc(id));
      if (snapshot.id.isNotEmpty) {
        final UserModel data = UserModel.fromjson(snapshot.data()!);
        _userdata = data;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }
}

authERROR(String error) {
  switch (error) {
    case "email-already-in-use":
      return "The email address is already in use by another account.";
    case "invalid-email":
      return "The email address is badly formatted.";
    case "wrong-password":
      return "The password is invalid or the user does not have a password.";
    default:
  }
}
