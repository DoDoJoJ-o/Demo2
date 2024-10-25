// To parse this JSON data, do
//
//     final loginuser = loginuserFromJson(jsonString);

import 'dart:convert';

Loginuser loginuserFromJson(String str) => Loginuser.fromJson(json.decode(str));

String loginuserToJson(Loginuser data) => json.encode(data.toJson());

class Loginuser {
    String phoneNumber;
    String password;

    Loginuser({
        required this.phoneNumber,
        required this.password,
    });

    factory Loginuser.fromJson(Map<String, dynamic> json) => Loginuser(
        phoneNumber: json["phone_number"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "password": password,
    };
}
