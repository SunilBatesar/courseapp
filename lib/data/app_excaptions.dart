import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class AppExcaptions implements Exception {
  final String? message;
  final String? prefix;
  AppExcaptions([this.message, this.prefix]);
  @override
  String toString() {
    return "$prefix :: $message";
  }
}

class AuthException extends AppExcaptions {
  AuthException([msg]) : super(msg, "UnAuthorized Access!");
}

class Socketexception extends AppExcaptions {
  Socketexception([msg]) : super(msg, "No Internet!");
}

class Timeoutexception extends AppExcaptions {
  Timeoutexception([msg]) : super(msg, "Timeout Exception!");
}

errorFunction(Object error) {
  switch (error) {
    case FirebaseAuthException _:
      throw AuthException(error.message);
    case SocketException _:
      throw Socketexception(error.message);
    case TimeoutException _:
      throw Timeoutexception(error.message);
    default:
      throw error;
  }
}
