import 'package:courses_app/model/all_model.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  dynamic _userdata;
  // Get User Data
  UserModel get userdata => _userdata;
  //  Set user Data
  setUserData(UserModel model) {
    _userdata = model;
    notifyListeners();
  }
}
