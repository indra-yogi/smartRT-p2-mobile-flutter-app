import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/marital_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';

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

  static Future<Marital> addMarital(Marital marital) async {
    final token = UserService().getToken();

    Map data = {
      'maritalNumber': marital.maritalNumber,
      'maritalSerial': marital.maritalSerial,
      'marriedDate': marital.marriedDate,
      'marriedPlace': marital.marriedPlace,
      'husbandName': marital.husbandName,
      'husbandNik': marital.husbandNik,
      'husbandBirthDate': marital.husbandBirthDate,
      'husbandBirthPlace': marital.husbandBirthPlace,
      'husbandNationality': marital.husbandNationality,
      'husbandReligion': marital.husbandReligion,
      'wifeName': marital.wifeName,
      'wifeNik': marital.wifeNik,
      'wifeBirthDate': marital.wifeBirthDate,
      'wifeBirthPlace': marital.wifeBirthPlace,
      'wifeNationality': marital.wifeNationality,
      'wifeReligion': marital.wifeReligion,
      'maritalAttachment': marital.maritalAttachment,
      'husbandAttachment': marital.husbandAttachment,
      'wifeAttachment': marital.wifeAttachment,
    };

    var response = await client.post(Uri.parse(urlAddMarital),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Marital.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal tambah data');
    }
  }

  static Future<Marital> getMaritalDetail(String id) async {
    var response = await client.get(Uri.parse(urlShowMarital + '$id'));

    if (response.statusCode == 200) {
      var data = response.body;
      return Marital.fromJson(json.decode(data));
    } else {
      return null;
    }
  }
}