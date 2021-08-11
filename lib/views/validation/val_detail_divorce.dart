import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/model/divorce_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/home/home.dart';

class ValidateDetailDivorcePage extends StatefulWidget {
  ValidateDetailDivorcePage(this.divorce);

  final Divorce divorce;

  @override
  _DetailMaritalState createState() => _DetailMaritalState();
}

class _DetailMaritalState extends State<ValidateDetailDivorcePage> {
  _DetailMaritalState();

  Future validate() async {
      Dio client = new Dio();

      final divorceId = widget.divorce.id;
      String token = await UserService().getToken();
      client.options.headers["Authorization"] = token;
      final response = await client.put(
        "http://10.0.2.2:8000/api/divorce/statusUpdate/$divorceId/APPROVED",
      );
      print(response);
      Get.to(() => Home());
  }

  Future rejected() async {
      Dio client = new Dio();

      final divorceId = widget.divorce.id;
      String token = await UserService().getToken();
      client.options.headers["Authorization"] = token;
      final response = await client.put(
        "http://10.0.2.2:8000/api/divorce/statusUpdate/$divorceId/REJECTED",
      );
      print(response);
      Get.to(() => Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text( widget.divorce.name ),
        centerTitle: true,
        ),
      body: InteractiveViewer(
        constrained: false,
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
                  SizedBox(height: 18,),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () {
                        rejected();
                      }, child: Text('Tolak Validasi'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)
                      ),),
                      SizedBox(width: 20,),
                      ElevatedButton(onPressed: () {
                        validate();
                      }, child: Text('Validasi')),
                    ],
                  )
                ],  
              ),
            ],
          ),
        ),
      ),
    );
  }
}