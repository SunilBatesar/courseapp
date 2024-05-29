abstract class Validator {
  validator(String? value);
}

class TextValidator extends Validator {
  @override
  validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter this filed";
    } else {  
      return null;
    }
  }
}

class EmailValidator extends Validator {
  @override
  validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Your Email";
    } else if (!value.endsWith("@gmail.com")) {
      return "Please Enter a Valid Email";
    } else {
      return null;
    }
  }
}

class PasswordValidator extends Validator {
  @override
  validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Your Password";
    } else if (value.length < 4) {
      return "Please Enter atleast 4 characters as Password";
    } else {
      return null;
    }
  }
}

class PhoneNumberValidator extends Validator {
  @override
  validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Your Phone Number";
    } else if (value.length < 10 || value.length > 10) {
      return "Please Enter atleast 10 digit Phone Number";
    } else {
      return null;
    }
  }
}

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
    } else if (value.length < 4) {
      return "Please Enter atleast 4 characters as Password";
    } else {
      return null;
    }
  }

  static phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Your Phone Number";
    } else if (value.length < 10 || value.length > 10) {
      return "Please Enter atleast 10 digit Phone Number";
    } else {
      return null;
    }
  }
}
