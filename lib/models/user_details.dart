import 'dart:convert';

UserDetails getCLassModelFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

class UserDetails {
  List<Data>? data;

  UserDetails({this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
