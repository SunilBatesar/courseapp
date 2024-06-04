import 'package:courses_app/utils/enums/app_enum.dart';

abstract class FirebaseService {
  Future<dynamic> get(dynamic path);
  Future<dynamic> post(dynamic path, Map<String, dynamic> data);
  Future<dynamic> update(dynamic path, Map<String, dynamic> data);
  Future<dynamic> authenticate(AuthState state, {Map<String, dynamic>? json});
}
