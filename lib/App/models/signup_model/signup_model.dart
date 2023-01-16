// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel? signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel? data) => json.encode(data!.toJson());

class SignUpModel {
  SignUpModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
    this.confirmPassword,
    this.address,
    this.validMeansOfIdentification,
    this.number,
    this.bvn,
    this.transactionPin,
    this.confirmTransactionPin,
    this.newPassword,
    this.otp,
  });

  String? firstName;
  String? middleName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? confirmPassword;
  String? address;
  String? validMeansOfIdentification;
  String? number;
  String? bvn;
  String? transactionPin;
  String? confirmTransactionPin;
  String? newPassword;
  String? otp;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        address: json["address"],
        validMeansOfIdentification: json["validMeansOfIdentification"],
        number: json["number"],
        bvn: json["bvn"],
        transactionPin: json["transactionPin"],
        confirmTransactionPin: json["confirmTransactionPin"],
        newPassword: json["newPassword"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "address": address,
        "validMeansOfIdentification": validMeansOfIdentification,
        "number": number,
        "bvn": bvn,
        "transactionPin": transactionPin,
        "confirmTransactionPin": confirmTransactionPin,
        "newPassword": newPassword,
        "otp": otp,
      };
}
