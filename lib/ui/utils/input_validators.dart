
import 'package:flutter_stacked_starter/constants/app_strings.dart';

class InputValidators {
  static String? validateEmailAddress(String? email, String? hintText) {
    if (email == null || email.isEmpty) {
      return emptyEmailField;
    }

    if (!RegExp(emailRegex).hasMatch(email)) {
      return invalidEmailField;
    }

    return null;
  }

  static String? validatePasswordSignIn(String? password, String? hintText) {
    if (password == null || password.isEmpty) {
      return emptyPasswordField;
    }

    if (password.length < 8) {
      return passwordLengthError;
    }

    return null;
  }

  static String? validatePasswordSignUp(String? password, String? hintText) {
    if (password == null || password.isEmpty) {
      return signUpPasswordMessage;
    }

    if (password.length < 8) {
      return signUpPasswordMessage;
    }

    if (!RegExp(digitRegex).hasMatch(password)) {
      return signUpPasswordMessage;
    }

    if (!RegExp(symbolRegex).hasMatch(password)) {
      return signUpPasswordMessage;
    }

    if (!RegExp(upperCaseRegex).hasMatch(password)) {
      return signUpPasswordMessage;
    }

    return null;
  }

  static String? validateText(String? text, String? hintText) {
    if (text == null || text.isEmpty) {
      return '$hintText cannot be empty';
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password cannot be empty';
    } else if (confirmPassword != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
