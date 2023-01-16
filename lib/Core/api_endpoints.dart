const String BASE_URL = 'https://compactpay.onrender.com';

class ApiEndpoint {
  static String loginUser() {
    return '$BASE_URL/api/users/login';
  }

  static String verifyEmailReg() {
    return '$BASE_URL/passpoint-oneapp/v1/user-app/verify-email-reg';
  }
}
