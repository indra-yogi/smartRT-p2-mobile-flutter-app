import 'package:flutter/material.dart';
import 'package:p2_mobile_app/model/divorce_model.dart';

class DetailDivorcePage extends StatefulWidget {
  DetailDivorcePage(this.divorce);

  final Divorce divorce;

  @override
  _DetailMaritalState createState() => _DetailMaritalState();
}

class _DetailMaritalState extends State<DetailDivorcePage> {
  _DetailMaritalState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text( widget.divorce.name ),
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
                    "No. Akta Perceraian :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "No. Akta Perkawinan :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "No. Serial Perceraian :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tempat Perceraian :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tanggal Perceraian :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Nama :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "NIK :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tempat Lahir :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Tanggal Lahir :",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    "Agama :",
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
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.divorce.divorceNumber,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.maritalNumber,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.divorceSerial,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.divorcePlace,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.divorceDate,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.name,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.nik,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.birthPlace,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.birthDate,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.religion,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                    widget.divorce.address,
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