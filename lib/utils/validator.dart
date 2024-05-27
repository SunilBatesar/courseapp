class AppValidator {
  static textValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return "Please Enter $text";
    } else {
      return null;
    }
  }

  static emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Your Email";
    } else if (!value.endsWith("@gmail.com")) {
      return "Please Enter a Valid Email";
    } else {
      return null;
    }
  }

  static passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Your Password";
    }
    if (value.length < 4) {
      return "Please Enter atleast 4 characters as Password";
    } else {
      return null;
    }
  }
}
