import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/user_model.dart';
import 'dart:async';

class UserService {
  var client = http.Client();

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  /*Future<List<User>> getUser() async {
    String token;
    UserService().getToken().then((value) {
      token = value;
    });

    var response = await client.get(Uri.parse(currentUserUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    if (response.statusCode == 200) {
      var data = response.body;
      return userFromJson(data);
    } else {
      return null;
    }
  } */

  Future<User> getUserDetail() async {
    String token;
    UserService().getToken().then((value) {
      token = value;
    });

    var response = await client.get(Uri.parse(currentUserUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    if (response.statusCode == 200) {
      var data = response.body;
      return User.fromJson(json.decode(data));
    } else {
      return null;
    }
  }

}