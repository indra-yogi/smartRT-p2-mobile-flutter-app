import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/views/auth/login_view.dart';
import 'package:p2_mobile_app/views/divorce/divorce.dart';
import 'package:p2_mobile_app/views/marital/marital.dart';

class Home extends StatelessWidget {
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
        ],

      )
    );
  }
}