import 'dart:io';

import 'package:dio/dio.dart';

import '../../Core/api_endpoints.dart';
import '../models/login_model/login_response.dart';
import '../models/signup_model/signup_model.dart';

class LoginService {
  static final Dio dio = Dio();
  static String errorMessage = '';

  static Future<LoginResponse?> loginUser(SignUpModel newLogin) async {
    final url = ApiEndpoint.loginUser();
    try {
      var response = await dio.post(
        url,
        data: newLogin.toJson(),
      );
      if (response.statusCode == 202) {
        var newLogin = LoginResponse.fromJson(response.data);
        return newLogin;
      } else {
        errorMessage = response.statusMessage!;
      }
    } catch (e) {
      if (e is SocketException) {
        return LoginResponse(message: e.message);
      } else if (e is DioError) {
        return LoginResponse(message: e.response!.data['message']);
      }
    }
  }
}

// class VerifyEmailService {
//   static final Dio dio = Dio();
//
//   static Future<CreateAccountResponse?> verifyEmail(VerifyEmailModel confirmOTP) async {
//     final url = ApiEndpoint.verifyEmailReg();
//     try {
//       var response = await dio.post(
//         url,
//         data: confirmOTP.toJson(),
//       );
//       // print(response.data);
//       if (response.statusCode == 200) {
//         //print(response.data);
//         var otpConfirmed = CreateAccountResponse.fromJson(response.data);
//         //  print("this is response description ${createUser.responseDescription}");
//         // print(createUser);
//         return otpConfirmed;
//       }
//     } catch (e) {
//       if (e is SocketException) {
//         return CreateAccountResponse(responseMessage: e.message);
//       } else
//       if (e is DioError) {
//         return CreateAccountResponse(responseMessage: e.response!.data['responseMessage']);
//       }
//     }
//   }
// }
