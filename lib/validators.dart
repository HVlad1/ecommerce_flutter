import 'package:email_validator/email_validator.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Email Address';
  } else if (!EmailValidator.validate(value)) {
    return 'Please enter a valid Email Address';
  }
  return null;
}

String? fullNameValidator(String? value) {
  String patttern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
  RegExp regExp = RegExp(patttern);
  if (value!.isEmpty) {
    return 'Please enter your Full Name';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Full Name';
  }
  return null;
}

String? addressValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your Address";
  } else {
    return null;
  }
}

String? cityValidator(String? value) {
  String patttern = r"^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$";
  RegExp regExp = RegExp(patttern);
  if (value!.isEmpty) {
    return 'Please enter your City';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid City';
  }
  return null;
}

String? countryValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your Country";
  } else {
    return null;
  }
}

String? zipCodeValidator(String? value) {
  String patttern = r"^\d{6}(?:[-\s]\d{4})?$";
  RegExp regExp = RegExp(patttern);
  if (value!.isEmpty) {
    return 'Please enter a Zip Code';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Zip Code';
  }
  return null;
}

String? passwordValidator(String? value) {
  // ex: Test1234*
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Please enter your password';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid password';
  }
  return null;
}
