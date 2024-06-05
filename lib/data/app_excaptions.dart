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
  EmailAlreadyUse([msg]) : super(msg, "");
}
