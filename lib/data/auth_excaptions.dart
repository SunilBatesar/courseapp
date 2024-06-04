class AuthExcaptions implements Exception {
  String message;
  AuthExcaptions(this.message);
  @override
  String toString() {
    return message;
  }
}

class EmailAlreadyUse extends AuthExcaptions {
  EmailAlreadyUse(super.message);
}
