import 'package:email_validator/email_validator.dart';

class Validator {
  static bool isEmail(String email) => EmailValidator.validate(email);

// Making Form Email Validation
  String validateEmail(String value) {
    bool isEmail(String email) => EmailValidator.validate(email);
    String msg = '';
    if (!isEmail(value.trim())) {
      msg = 'Please enter a valid email';
    } else {
      msg = null;
    }
    return msg;
  }

  String usernameValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 4) {
      return 'Name must be 4';
    }
  }

  String mobileValidator(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
  }
}
