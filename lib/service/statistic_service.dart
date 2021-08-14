import 'package:http/http.dart' as http;
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/statistic_model.dart';
import 'dart:async';

class StatisticService {
  var client = http.Client();

  Future<List<Statistic>> getAll() async {
    var response = await client.get(Uri.parse(urlAllData));

    if (response.statusCode == 200) {
      var data = response.body;
      return statisticFromJson(data);
    } else {
      return null;
    }
  }
}