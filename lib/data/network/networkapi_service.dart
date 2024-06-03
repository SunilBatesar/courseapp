import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/network/baseapi_service.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NetworkFirebaseService extends FirebaseService {
  final firebase = FirebaseFirestore.instance;
  @override
  Future get(path) {
    Future<Object> response;
    if (path is CollectionReference) {
      response = path.get();
      // TODO ;; IMPLEMENT COLLECTION FUNCTIONALITY
    } else if (path is Query<Map<String, dynamic>>) {
      response = path.get();
      // TODO ;; IMPLEMENT WHERE METHOD COLLECTION FUNCTIONALITY
    } else {
      response = (path as DocumentReference).get();
      // TODO;; IMPLEMENT DOCUEMENT FUNCTIONALITY
    }

    return response;
  }

  @override
  Future post(path, data) {
    Future<void> response;
    if (path is CollectionReference) {
      response = path.add(data);
      // TODO ;; IMPLEMENT COLLECTION FUNCTIONALITY
    } else {
      response = (path as DocumentReference).set(data);
      // TODO;; IMPLEMENT DOCUEMENT FUNCTIONALITY
    }

    return response;
  }

  @override
  Future update(path, data) {
    return (path as DocumentReference).update(data);
    // TODO;; UPDATE DOCUEMENT FUNCTIONALITY
  }
}

// Network Firebase Auth Service Class
class NetworkFirebaseAuthService extends FirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp(UserModel model, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: model.email, password: password);
      return model.copyWith(uid: userCredential.user!.uid);
    } catch (e) {
      rethrow;
    }
  }
}
