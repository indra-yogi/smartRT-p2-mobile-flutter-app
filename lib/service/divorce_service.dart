import 'package:http/http.dart' as http;
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/divorce_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';

class DivorceService {
  static var client = http.Client();

  static Future<List<Divorce>> getDivorce() async {
    String token;
    await UserService().getToken().then((value) {
      token = value;
    });
    
    Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization': token
     };

    var response = await client.get(Uri.parse(urlDivorce),
      headers: requestHeaders
    );

    if (response.statusCode == 200) {
      var data = response.body;
      return divorceFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<Divorce>> getValidateDivorce() async {
    String token;
    await UserService().getToken().then((value) {
      token = value;
    });
    
    Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization': token
     };

    var response = await client.get(Uri.parse(urlDivorce),
      headers: requestHeaders
    );

    if (response.statusCode == 200) {
      var data = response.body;
      return divorceFromJson(data);
    } else {
      return null;
    }
  }
}
