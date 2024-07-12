import 'package:email_validator/email_validator.dart';

mixin EmailValidatorMixin {
  String? validateEmail(String? val) {
    if (EmailValidator.validate(val ?? "")) {
      return null;
    } else {
      return "Please provide a valid email address.";
    }
  }
}
