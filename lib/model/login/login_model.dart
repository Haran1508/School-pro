// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.isSuccess,
    this.message,
    this.usr,
    this.usrToken,
  });

  int status;
  bool isSuccess;
  List<String> message;
  Usr usr;
  String usrToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    isSuccess: json["is_success"],
    message: List<String>.from(json["message"].map((x) => x)),
    usr: Usr.fromJson(json["usr"]),
    usrToken: json["usr_token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "is_success": isSuccess,
    "message": List<dynamic>.from(message.map((x) => x)),
    "usr": usr.toJson(),
    "usr_token": usrToken,
  };
}

class Usr {
  Usr({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.isSubscribed,
  });

  int id;
  String name;
  String email;
  String mobile;
  dynamic address;
  bool isSubscribed;

  factory Usr.fromJson(Map<String, dynamic> json) => Usr(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "is_subscribed": isSubscribed,
  };
}
