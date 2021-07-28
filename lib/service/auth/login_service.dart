import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/auth/login_model.dart';
import 'package:p2_mobile_app/model/error_model.dart';

class LoginService{
  var client = http.Client();

  Future<List> login({String nik, String password}) async {
    var response = await client.post(Uri.parse(urlLogin),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',      
    },
    body: jsonEncode(<String, String>{"nik": nik, "password": password})
    );

    if (response.statusCode == 200) {
      var json = response.body;
      var loginRes = loginRespFromJson(json);
      if(loginRes != null) {
        return [loginRes.accessToken, ""];
      } else {
        return ["", "Unknown Error"];
      }
    } else {
      var json = response.body;
      var errorResp = errorRespFromJson(json);
      if (errorResp == null) {
        return ["", "Unknown Error"];
      } else {
        return ["", errorResp.error];
      }
    }
  }
}