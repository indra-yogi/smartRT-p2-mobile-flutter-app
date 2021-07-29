import 'package:get/state_manager.dart';
import 'package:p2_mobile_app/service/auth/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  var error = "";

  Future<String> login({String nik, String password}) async {
    error="";
    try {
      loginProcess(true);
      List loginResp = await LoginService().login(nik: nik, password: password);
      if (loginResp[0] != "") {
        //success
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", loginResp[0]);
      } else {
        error = loginResp[1];
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }
}