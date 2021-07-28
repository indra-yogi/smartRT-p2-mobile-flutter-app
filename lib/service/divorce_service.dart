import 'package:http/http.dart' as http;
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/divorce_model.dart';

class DivorceService {
  static var client = http.Client();

  static Future<List<Divorce>> getDivorce() async {
    var response = await client.get(Uri.parse(urlIndexDivorce));

    if (response.statusCode == 200) {
      var data = response.body;
      return divorceFromJson(data);
    } else {
      return null;
    }
  }
}
