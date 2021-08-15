import 'package:http/http.dart' as http;
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/statistic_model.dart';
import 'dart:async';

class StatisticService {
  static var client = http.Client();

  static Future<List<Statistic>> getMaritalChart() async {
    var response = await client.get(Uri.parse(urlMaritalChart));

    if (response.statusCode == 200) {
      var data = response.body;
      return statisticFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<Statistic>> getDivorceChart() async {
    var response = await client.get(Uri.parse(urlDivorceChart));

    if (response.statusCode == 200) {
      var data = response.body;
      return statisticFromJson(data);
    } else {
      return null;
    }
  }
}