import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/marital_controller.dart';
import 'package:p2_mobile_app/model/marital_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';

class DetailMaritalPage extends StatefulWidget {
  DetailMaritalPage(this.marital);

  final Marital marital;
  final userId = UserService().getToken();

  @override
  _DetailMaritalState createState() => _DetailMaritalState();
}

class _DetailMaritalState extends State<DetailMaritalPage> {
  _DetailMaritalState();

  final MaritalController _controller = Get.put(MaritalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text( widget.marital.husbandName ),
        centerTitle: true,
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No. Akta Perkawinan :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tempat Perkawinan :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tanggal Perkawinan :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "No. Serial Perkawinan :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Nama Suami :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "NIK Suami :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tempat Lahir Suami :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tanggal Lahir Suami :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Kewarganegaraan Suami :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Agama Suami :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Nama Istri :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "NIK Istri :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tempat Lahir Istri :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tanggal Lahir Istri :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Kewarganegaraan Istri :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Agama Istri :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Alamat :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ],  
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.marital.maritalNumber,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.marriedPlace,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.marriedDate,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.maritalSerial,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.husbandName,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.husbandNik,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.husbandBirthPlace,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.husbandBirthDate,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.husbandNationality,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.husbandReligion,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.wifeName,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.wifeNik,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.wifeBirthPlace,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.wifeBirthDate,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.wifeNationality,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.wifeReligion,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.marital.address,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ],  
              ),
            ],
          ),
        ),
      ),
    );
  }
}