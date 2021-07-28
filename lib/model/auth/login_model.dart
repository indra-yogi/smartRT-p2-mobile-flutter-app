import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

LoginResp loginRespFromJson(String str) =>
    LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => 
    json.encode(data.toJson());

class LoginResp {
  LoginResp({
    this.accessToken,
    this.tokenType,
  });

  String accessToken;
  String tokenType;

  factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
    accessToken: json['content']['access_token'],
    tokenType: json['content']['token_type'],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType
  };
}

class UserLogin {
  static Future<String> getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}