// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse? signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse? data) =>
    json.encode(data!.toJson());

class SignUpResponse {
  SignUpResponse({
    this.message,
    this.user,
  });

  String? message;
  User? user;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.firstName,
    this.middleName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
    this.otp,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? firstName;
  String? middleName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? otp;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        otp: json["otp"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "otp": otp,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
