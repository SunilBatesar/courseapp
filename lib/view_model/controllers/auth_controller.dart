import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/app_excaptions.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {}

abstract class DatabaseController {
  Future<dynamic> getDataResponse(dynamic path);
}

// class APIResponseController extends DatabaseController {
//   @override
//   Future getDataResponse(path, {Map<String, dynamic>? json}) {
//     if (path is String) {
//       http.get(Uri.parse(path));
//     }
//   }
// }

class FirebaseResponseController extends DatabaseController {
  @override
  Future getDataResponse(path) async {
    try {
      if (path is CollectionReference) {
        final response = await path.get();
        response.docs.map((v) => {});
      } else if (path is DocumentReference) {
        final snapshot = await path.get();
        snapshot.data();
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw InvalidCredentialsException(e.toString());
      } else if (e is FirebaseException) {
        throw UnauthorizedException(e.toString());
      } else {
        rethrow;
      }
    }
  }
}

class userClassControler extends ChangeNotifier {
  final api = FirebaseResponseController();

  final firestore = FirebaseFirestore.instance;

  dynamic userData;

  dynamic ratings;

  // getUser profile

  void getUserFromFirebase() async {
    // setLoader(true);
    try {
      final user =
          await api.getDataResponse(firestore.collection("users").doc("uid"));
      final json = (user as DocumentSnapshot<Object?>).data();

      userData = UserModel.fromjson(json as Map<String, dynamic>);
    } catch (e) {
      // ShowToast(e.toString());
    } finally {
      // setLoader(false);
      notifyListeners();
    }
  }

  getUserRatings() async {
    try {
      final user =
          await api.getDataResponse(firestore.collection("Ratings").doc("uid"));
      final json = (user as DocumentSnapshot<Object?>).data();

      ratings = UserModel.fromjson(json as Map<String, dynamic>);
    } catch (e) {
      if (e is AppExcaptions) {
        e.message;
      }
      e.toString();
    }
  }
}

// class userDatacontroler extends ChangeNotifier {
//   var version = "v1";
//   api() =>
//       version == "v1" ? APIResponseController() : FirebaseResponseController();

//   final firebase = FirebaseResponseController();
// }

// EXCEPTION HANDLER

// Authentication Error :: Email and password are invalid;

class MyExceptions implements Exception {
  final message;
  final prefix;

  MyExceptions([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix :: $message";
  }
}

class InvalidCredentialsException extends MyExceptions {
  InvalidCredentialsException([String? msg])
      : super([msg, "Invalid Credentials"]);
}

class UnauthorizedException extends MyExceptions {
  UnauthorizedException([String? msg]) : super([msg, "Unauthorized"]);
}
