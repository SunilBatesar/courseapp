import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/Preferences/sharedpreferences.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/response/data_response.dart';
import 'package:courses_app/utils/enums/app_enum.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // Call Network Firebase Service
  final _service = NetworkFirebaseService();
  DataResponse<UserModel> _userdata = DataResponse.loading();
  // Get User Data
  DataResponse<UserModel> get userdata => _userdata;
  //  Set user Data
  setUserData(DataResponse<UserModel> model) {
    _userdata = model;
    update();
  }

  //  SignUp
  Future signUp(Map<String, dynamic> jsondata, BuildContext context) async {
    // GET TO JSON DATA AND SAVE USERDATA
    final UserModel usersdata = UserModel.fromjson(jsondata["data"]);
    try {
      // CALL AUTHENTICATE FUNCTION AND SAVE USERCREDENTIAL (SIGNUP USER)
      final usercredential = await maindata.networkFirebaseService
          .authenticate(AuthState.SIGNUP, json: {
        "email": usersdata.email,
        "password": jsondata["password"]
      }) as UserCredential;
      // USER ID
      final String id = usercredential.user!.uid;
      if (id.isNotEmpty) {
        // CALL POST FUNCTION AND SAVE USER DATA FIREBASE COLLECTION
        await maindata.networkFirebaseService.post(
            maindata.apis.userdoc(id), usersdata.copyWith(uid: id).tomap());
        // SAVE USER DATA CONTROLLER
        setUserData(DataResponse.completed(usersdata.copyWith(uid: id)));
        // SET SHAREDPREFS (USER ID)
        await SPref.setSharedPrefs(SPref.userIDKey, id);
        // OFF ALL SCREEN (APP BOTTOMNAVIGATIONBAR)
        Get.offAllNamed(RouteName.appBottomNavigationBar);
      }
    } catch (e) {
      print(e.toString());
      setUserData(DataResponse.error(e.toString()));
    } finally {
      update();
    }
  }

  //  Login
  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      //  CALL GET FUNCTION AND SAVE SNAPSHOT
      final snapshot = await maindata.networkFirebaseService
              .get(maindata.apis.userReference.where("email", isEqualTo: email))
          as QuerySnapshot<Map<String, dynamic>>;

      //  SNAPSHOT (ISEMPTY YA ISNOTEMPTY)
      if (snapshot.docs.isNotEmpty) {
        // CALL AUTHENTICATE FUNCTION AND LOGIN USER
        final usercredential = await maindata.networkFirebaseService
            .authenticate(AuthState.LOGIN,
                json: {"email": email, "password": password}) as UserCredential;
        // USER DATA CONVERT TO USERMODEL AND SAVE DATA
        final UserModel data = UserModel.fromjson(snapshot.docs.first.data());
        // SET SHAREDPREFS (USER ID)
        await SPref.setSharedPrefs(SPref.userIDKey, usercredential.user!.uid);
        // SAVE USER DATA CONTROLLER
        setUserData(DataResponse.completed(data));
        // OFF ALL SCREEN (APP BOTTOMNAVIGATIONBAR)
        Get.offAllNamed(RouteName.appBottomNavigationBar);
      }
    } catch (e) {
      print(e.toString());
      setUserData(DataResponse.error(e.toString()));
    } finally {
      update();
    }
  }

  //  User Data Get In FirebaseFirestore (Use User ID)
  Future<void> getUserDataFirebase(String id, BuildContext context) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _service.get(maindata.apis.userdoc(id));
      if (snapshot.id.isNotEmpty) {
        final UserModel data = UserModel.fromjson(snapshot.data()!);
        setUserData(DataResponse.completed(data));
      }
    } catch (e) {
      print(e);
      setUserData(DataResponse.error(e.toString()));
    } finally {
      update();
    }
  }

  // LOGOUT
  Future<void> logout() async {
    try {
      await _service.authenticate(AuthState.LOGOUT).then(
        (value) async {
          await SPref.removSharedPrefs(SPref.userIDKey);
          await Get.offNamedUntil(RouteName.loginScreen, (route) => false);
        },
      );
    } catch (e) {
      print("--------");
      print(e.toString());
      print("--------");
    }
  }
}
