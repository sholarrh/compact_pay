import 'package:dio/dio.dart';

class LoginService {
  static final Dio dio = Dio();
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
