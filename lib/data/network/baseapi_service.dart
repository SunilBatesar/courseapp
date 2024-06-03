import 'package:courses_app/model/all_model.dart';

abstract class FirebaseService {
  Future<dynamic> get(dynamic path);
  Future<dynamic> post(dynamic path, Map<String, dynamic> data);
  Future<dynamic> update(dynamic path, Map<String, dynamic> data);
}

abstract class FirebaseAuthService {
  Future<UserModel> signUp(UserModel model, String password);
  Future<dynamic> login(String email, String password);
}
