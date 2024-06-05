import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/repository/user_repository.dart';
import 'package:courses_app/utils/enums/app_enum.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserViewModel extends ChangeNotifier {
  // Call Network Firebase Service
  final _service = NetworkFirebaseService();
  // Call User Repository
  // ignore: unused_field
  final _repository = UserRepository();
  dynamic _userdata;
  // Get User Data
  UserModel get userdata => _userdata;
  //  Set user Data
  setUserData(UserModel model) {
    _userdata = model;
    notifyListeners();
  }

  //  SignUp
  Future signUp(Map<String, dynamic> jsondata, BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    final UserModel usersdata = UserModel.fromjson(jsondata["data"]);
    try {
      final usercredential = await maindata.networkFirebaseService
          .authenticate(AuthState.SIGNUP, json: {
        "email": usersdata.email,
        "password": jsondata["password"]
      }) as UserCredential;
      final String id = usercredential.user!.uid;
      if (id.isNotEmpty) {
        await maindata.networkFirebaseService.post(
            maindata.apis.userdoc(id), usersdata.copyWith(uid: id).tomap());
        _userdata = usersdata.copyWith(uid: id);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
      loading.setloading(false);
    }
  }

  //  Login
  Future<void> login(
      String email, String password, BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final snapshot = await maindata.networkFirebaseService
              .get(maindata.apis.userReference.where("email", isEqualTo: email))
          as QuerySnapshot<Map<String, dynamic>>;
      if (snapshot.docs.isNotEmpty) {
        await maindata.networkFirebaseService.authenticate(AuthState.LOGIN,
            json: {"email": email, "password": password}) as UserCredential;

        final UserModel data = UserModel.fromjson(snapshot.docs.first.data());
        _userdata = data;
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.appBottomNavigationBar, (route) => false);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
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

String authERROR(String error) {
  switch (error) {
    case "auth/user-not-found":
      return "No user found with this email.";
    case "email-already-in-use":
      return "The email address is already in use by another account.";
    case "invalid-email":
      return "The email address is badly formatted.";
    case "wrong-password":
      return "The password is invalid or the user does not have a password.";
    default:
      return error;
  }
}
