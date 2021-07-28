import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/marital_model.dart';

class MaritalService {
  static var client = http.Client();

  static Future<List<Marital>> getMarital() async {
    var response = await client.get(Uri.parse(urlIndexMarital));

    if (response.statusCode == 200) {
      var data = response.body;
      return maritalFromJson(data);
    } else {
      return null;
    }
  }

  Future<List<Marital>> addMarital() async {
    var response = await client.post(Uri.parse(urlAddMarital));

    if (response.statusCode == 200) {
      var data = response.body;
      return maritalFromJson(data);
    } else {
      return null;
    }
  }
}