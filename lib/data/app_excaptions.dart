class AppExcaptions implements Exception {
  final String? message;
  final String? prefix;
  AppExcaptions([this.message, this.prefix]);
  @override
  String toString() {
    return "$prefix :: $message";
  }
}

class EmailAlreadyUse extends AppExcaptions {
  EmailAlreadyUse([msg])
      : super(msg, "The email address is already in use by another account.");
}

class UserNotFound extends AppExcaptions {
  UserNotFound([msg]) : super(msg, "No user found with this email.");
}

class WrongPassword extends AppExcaptions {
  WrongPassword([msg])
      : super(msg,
            "The password is invalid or the user does not have a password.");
}
