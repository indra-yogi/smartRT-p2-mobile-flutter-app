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
        'Authorization': token,
      }
    );

    if (response.statusCode == 200) {
      var data = response.body;
      return User.fromJson(json.decode(data));
    } else {
      return null;
    }
  }

  Future<User> addUser(User user) async {

    Map data = {
      'name': user.name,
      'phone': user.phone,
      'email': user.email,
      'nik': user.nik,
      'password': user.password,
      'address': user.address,
      'neighbourhood': user.neighbourhood,
      'position': user.position,
    };

    var response = await client.post(Uri.parse(urlRegister),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception ('Failed to Create User');
    }
  }

}