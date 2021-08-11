import 'package:http/http.dart' as http;
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/location/city_model.dart';
import 'package:p2_mobile_app/model/location/district_model.dart';
import 'package:p2_mobile_app/model/location/neighbourhood_model.dart';
import 'package:p2_mobile_app/model/location/province_model.dart';
import 'package:p2_mobile_app/model/location/village_model.dart';

class LocationService {
  static var client = http.Client();

  static Future<List<Neighbourhood>> getNeighbourhood(id) async {
    var response =  await client.get(Uri.parse(urlGetNeighbourhood + id));

    if(response.statusCode == 200 ) {
      var data = response.body;
      return neighbourhoodFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<Village>> getVillage(id) async {
    var response =  await client.get(Uri.parse(urlGetVillage + id));

    if(response.statusCode == 200 ) {
      var data = response.body;
      return villageFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<District>> getDistrict(id) async {
    var response =  await client.get(Uri.parse(urlGetNeighbourhood + id));

    if(response.statusCode == 200 ) {
      var data = response.body;
      return districtFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<City>> getCity(id) async {
    var response =  await client.get(Uri.parse(urlGetCity + id));

    if(response.statusCode == 200 ) {
      var data = response.body;
      return cityFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<Province>> getProvince() async {
    var response =  await client.get(Uri.parse(urlGetProvince));

    if(response.statusCode == 200 ) {
      var data = response.body;
      return provinceFromJson(data);
    } else {
      return null;
    }
  }
}