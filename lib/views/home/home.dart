import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/user_controller.dart';
import 'package:p2_mobile_app/model/user_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/auth/login_view.dart';
import 'package:p2_mobile_app/views/divorce/divorce.dart';
import 'package:p2_mobile_app/views/marital/marital.dart';
import 'package:p2_mobile_app/views/validation/validation_divorce.dart';
import 'package:p2_mobile_app/views/validation/validation_marital.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserController _controller = Get.put(UserController());
  final user = UserService().getUserDetail();
  final token = UserService().getToken();
  //Future<User> _selectedUser = UserService().getUserDetail();  

  Future<User> selectedUser;

  

  Future deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    return prefs.remove("token");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Perkawinan dan Perceraian"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx( () {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.count(
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
                  deleteToken();
                  Get.off(() => LoginPage());
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
            _adminMaritalValidation(),
            _adminDivorceValidation()
          ],

        );
      })
    );
  }

  Widget _adminMaritalValidation() {
    final isAdmin = _controller.selectedUser().role.name == "admin";
    return isAdmin ?
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
    final isAdmin = _controller.selectedUser().role.name == "admin";
    return isAdmin ?
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

