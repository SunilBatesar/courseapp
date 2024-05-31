abstract class FirebaseService {
  Future<dynamic> get(dynamic path);
  Future<dynamic> post(dynamic path, Map<String, dynamic> data);
  Future<dynamic> update(dynamic path,Map<String,dynamic> data);
}
