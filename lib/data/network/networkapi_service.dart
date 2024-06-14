import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/app_excaptions.dart';
import 'package:courses_app/data/network/baseapi_service.dart';
import 'package:courses_app/utils/enums/app_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NetworkFirebaseService extends FirebaseService {
  // CALL FIREBASEAUTH INSTANCE (_auth)
  final _auth = FirebaseAuth.instance;
  @override
  Future get(path) {
    Future<Object>? response;
    try {
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
    } catch (e) {
      errorFunction(e);
    }

    return response!;
  }

  @override
  Future post(path, data) {
    Future<void> response;
    try {
      if (path is CollectionReference) {
        response = path.add(data);
        // TODO ;; IMPLEMENT COLLECTION FUNCTIONALITY
      } else {
        response = (path as DocumentReference).set(data);
        // TODO;; IMPLEMENT DOCUEMENT FUNCTIONALITY
      }
    } catch (e) {
      rethrow;
    }

    return response;
  }

  @override
  Future update(path, data) {
    try {
      // TODO;; UPDATE DOCUEMENT FUNCTIONALITY
      return (path as DocumentReference).update(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future authenticate(AuthState state, {Map<String, dynamic>? json}) async {
    // SET EMAIL AND PASSWORD
    final String email = json != null ? json["email"] : "";
    final String password = json != null ? json["password"] : "";
    try {
      // CHECK USER AUTHSTATE
      if (state == AuthState.SIGNUP) {
        //  CREATE USER WITH EMAIL AND PASSWORD AMD RETURN USERCREDENTIAL
        return await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else if (state == AuthState.LOGIN) {
        //  SIGNIN USER WITH EMAIL AND PASSWORD AMD RETURN USERCREDENTIAL
        return await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        await _auth.signOut();
      }
    } catch (e) {
      errorFunction(e);
    }
  }
}
