const String BASE_URL = 'https://app-sandbox.mypasspoint.com';

class ApiEndpoint {
  static String initializeEmail() {
    return '$BASE_URL/passpoint-oneapp/v1/user-app/init-email-reg';
  }

  static String verifyEmailReg() {
    return '$BASE_URL/passpoint-oneapp/v1/user-app/verify-email-reg';
  }
}
