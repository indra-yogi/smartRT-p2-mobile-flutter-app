import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/user_model.dart';
import 'dart:async';

class UserService {
  var client = http.Client();

  Future<List<User>> getUser() async {
    var response = await client.get(Uri.parse(currentUserUrl));

    if (response.statusCode == 200) {
      var data = response.body;
      return userFromJson(data);
    } else {
      return null;
    }
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}