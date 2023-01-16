// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse? loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse? data) => json.encode(data!.toJson());

class LoginResponse {
  LoginResponse({
    this.message,
    this.token,
    this.user,
  });

  String? message;
  String? token;
  User? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
    this.otp,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.bvn,
    this.number,
    this.validMeansOfIdentification,
  });

  String? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? otp;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? address;
  String? bvn;
  String? number;
  String? validMeansOfIdentification;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        otp: json["otp"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        address: json["address"],
        bvn: json["bvn"],
        number: json["number"],
        validMeansOfIdentification: json["validMeansOfIdentification"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "otp": otp,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "address": address,
        "bvn": bvn,
        "number": number,
        "validMeansOfIdentification": validMeansOfIdentification,
      };
}
