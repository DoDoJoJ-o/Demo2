// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUser registerUserFromJson(String str) => RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
    String message;
    User user;

    RegisterUser({
        required this.message,
        required this.user,
    });

    factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int userId;
    String phoneNumber;
    String name;
    String userImage;
    String address;
    dynamic gpsLocation;
    String userType;

    User({
        required this.userId,
        required this.phoneNumber,
        required this.name,
        required this.userImage,
        required this.address,
        required this.gpsLocation,
        required this.userType,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        userImage: json["user_image"],
        address: json["address"],
        gpsLocation: json["gps_location"],
        userType: json["user_type"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "phone_number": phoneNumber,
        "name": name,
        "user_image": userImage,
        "address": address,
        "gps_location": gpsLocation,
        "user_type": userType,
    };
}
