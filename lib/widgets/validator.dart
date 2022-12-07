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
  } else if (formPhoneNumber.length != 10) {
    return 'PhoneNumber should not be more than ten digits.';
  }

  return null;
}

String? validateBvnNumber(String? formBvnNumber) {
  if (formBvnNumber == null || formBvnNumber.isEmpty) {
    return 'PhoneNumber is required.';
  } else if (formBvnNumber.length != 11) {
    return 'BVN should not be more than eleven(11) digits.';
  }

  return null;
}

String? validateNumber(String? formNumber) {
  if (formNumber == null || formNumber.isEmpty) {
    return 'Number is required.';
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
  if (formAccountNumber == null || formAccountNumber.isEmpty) {
    return 'Account Number is required.';
  } else if (formAccountNumber.length != 10) {
    return 'Account Number should not be more than ten(10) digits.';
  }

  return null;
}

String? validateAmount(String? formAmount) {
  if (formAmount == null || formAmount.isEmpty) return 'Input Amount.';

  return null;
}
String? validateTransactionPin(String? formTransactionPin) {
  if (formTransactionPin == null || formTransactionPin.isEmpty) {
    return 'Pin must not be empty.';
  } else if (formTransactionPin.length != 4) {
    return 'Pin required and must be four numbers.';
  }

  return null;
}

// CONFIRM PASSWORD
// String? validateConfirmPassword(String? formConfirmPassword, {required String str}) {
//   if (str != formConfirmPassword) {
//     return 'Passwords do not match.';
//   }
//
//   return null;
// }
