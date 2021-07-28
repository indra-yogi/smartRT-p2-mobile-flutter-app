import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:p2_mobile_app/controller/auth/login_controller.dart';
import 'package:p2_mobile_app/model/auth/login_model.dart';
import 'package:p2_mobile_app/views/auth/login_view.dart';
import 'package:p2_mobile_app/views/home/home.dart';


class HomeControlPage extends StatefulWidget {
  @override
  _HomeControlPageState createState() => _HomeControlPageState();
}

class _HomeControlPageState extends State<HomeControlPage> {
  final LoginController controller = Get.put(LoginController());

  Future<Widget> goto() async {
    String token = await UserLogin.getToken();
    if (token != null) {
      return Home();
    }
    return LoginPage();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: goto(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait...'));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data;
          } else {
            return Center(
              child: Text("Oop"),
            );
          }
        }
    );
  }
}