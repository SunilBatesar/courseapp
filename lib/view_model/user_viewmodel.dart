import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserViewModel extends ChangeNotifier {
  final _service = NetworkFirebaseService();
  dynamic _userdata;
  // Get User Data
  UserModel get userdata => _userdata;
  //  Set user Data
  setUserData(UserModel model) {
    _userdata = model;
    notifyListeners();
  }

  Future<void> setUserDataFirebase(
      UserModel model, BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      await _service.post(maindata.apis.userdoc(model.uid), model.tomap()).then(
        (value) {
          _userdata = model;
          notifyListeners();
        },
      );
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }

  Future<void> getUserDataFirebase(String id, BuildContext context) async {
    final userprovider = Provider.of<UserViewModel>(context, listen: false);
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _service.get(maindata.apis.userdoc(id));
      if (snapshot.id.isNotEmpty) {
        final UserModel data = UserModel.fromjson(snapshot.data()!);
        userprovider.setUserData(data);
        // _userdata = data;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading.setloading(false);
    }
  }
}
