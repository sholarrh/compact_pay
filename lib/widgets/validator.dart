// This The  Validator for the Textform Fields

String? validateFullName(String? formFullName) {
  if (formFullName == null || formFullName.isEmpty) {
    return 'Full Name is required.';
  }

  return null;
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address is required.';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePhoneNumber(String? formPhoneNumber) {
  if (formPhoneNumber == null || formPhoneNumber.isEmpty) {
    return 'PhoneNumber is required.';
  }

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
    Password must be at least 8 characters,
    include an uppercase letter, number and symbol.
    ''';
  }

  return null;
}

String? validateAccountNumber(String? formAccountNumber) {
  if (formAccountNumber == null || formAccountNumber.isEmpty)
    return 'Account Number is required.';

  return null;
}

String? validateAmount(String? formAmount) {
  if (formAmount == null || formAmount.isEmpty) return 'Input Amount.';

  return null;
}
String? validateTransactionPin(String? formTransactionPin) {
  if (formTransactionPin == null ||
      formTransactionPin.isEmpty && formTransactionPin.length == 4) {
    return 'Pin is required and must be four numbers.';
  }

  return null;
}
