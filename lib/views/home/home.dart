import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/model/user_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/auth/login_view.dart';
import 'package:p2_mobile_app/views/divorce/divorce.dart';
import 'package:p2_mobile_app/views/marital/marital.dart';
import 'package:p2_mobile_app/views/statistic/statistic.dart';
import 'package:p2_mobile_app/views/validation/validation_divorce.dart';
import 'package:p2_mobile_app/views/validation/validation_marital.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final user = UserService().getUserDetail();
  final token = UserService().getToken();
  Future<User> selectedUser = UserService().getUserDetail();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Perkawinan dan Perceraian"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Get.to(() => MaritalPage());
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people_alt_rounded),
                    SizedBox(height: 8,),
                    Text("Perkawinan")
                  ],
                ),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Get.to(() => DivorcePage());
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(height: 8,),
                    Text("Perceraian")
                  ],
                ),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Get.to(() => LoginPage());
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(height: 8,),
                    Text("Logout")
                  ],
                ),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Get.to(() => StatisticPage());
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pie_chart),
                    SizedBox(height: 8,),
                    Text("Statistics")
                  ],
                ),
              ),
            )
          ),
          _adminMaritalValidation(),
          _adminDivorceValidation()
        ],

      )
    );
  }

  Widget _adminMaritalValidation() {
    return ( user != null) ?
    Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Get.to(() => ValidateMaritalPage());
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.book),
                    SizedBox(height: 8,),
                    Text("Validasi Perkawinan", textAlign: TextAlign.center,)
                  ],
                ),
              ),
            )
          ) : Container();
  }

  Widget _adminDivorceValidation() {
    return ( user != null) ?
    Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Get.to(() => ValidateDivorcePage());
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.book),
                    SizedBox(height: 8,),
                    Text("Validasi Perceraian", textAlign: TextAlign.center,)
                  ],
                ),
              ),
            )
          ) : Container();
  }

}

