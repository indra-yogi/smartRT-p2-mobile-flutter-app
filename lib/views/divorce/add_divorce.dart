import 'package:dio/dio.dart' as dio;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p2_mobile_app/service/divorce_service.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:http/http.dart' as http;
//import 'package:p2_mobile_app/views/divorce/divorce.dart';
import 'package:p2_mobile_app/views/home/home.dart';


class AddDataDivorce extends StatefulWidget {
  AddDataDivorce();
  
  @override
    _AddDataDivorceState createState() => _AddDataDivorceState();
}

class _AddDataDivorceState extends State<AddDataDivorce> {
  _AddDataDivorceState();

  var client = http.Client();
  final picker = ImagePicker();
  final divorceService = DivorceService();
  final _addFormKey = GlobalKey<FormState>();
  final _divorceNumberCtrl = TextEditingController();
  final _maritalNumberCtrl = TextEditingController();
  final _divorceSerialCtrl = TextEditingController();
  final _divorcePlaceCtrl = TextEditingController();
  final _divorceDateCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _nikCtrl = TextEditingController();
  final _birthPlaceCtrl = TextEditingController();
  final _birthDateCtrl = TextEditingController();
  final _religionCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final token = UserService().getToken();

  String divorceNumber;
  String maritalNumber;
  String divorceSerial;
  String divorceDate;
  String divorcePlace;
  String name;
  String nik;
  String birthDate;
  String birthPlace;
  String religion;
  String address;
  File _image;

  Future getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 100,
      maxWidth: 120,
    );

    setState(() {
          if (pickedFile != null) {
            _image = File(pickedFile.path);
          } else {
            print('No image selected');
          }
        });
  }

  addData(
    String divorceNumber,
    String maritalNumber,
    String divorceSerial,
    String divorceDate,
    String divorcePlace,
    String name,
    String nik,
    String birthDate,
    String birthPlace,
    String religion,
    String address,
    File _image,

  ) async {
      String fileName = _image.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'divorce_number': divorceNumber,
        'marital_number': maritalNumber,
        'divorce_serial_number': divorceSerial,
        'divorce_date': divorceDate,
        'divorce_place': divorcePlace,
        'name': name,
        'nik': nik,
        'birth_date': birthDate,
        'birth_place': birthPlace,
        'religion': religion,
        'address': address,
        'attachment': await dio.MultipartFile.fromFile(
          _image.path,
          filename: fileName,
          //contentType: MediaType("image", ""),
        ),
      });
      String token = await UserService().getToken();
      dio.Dio client = new dio.Dio();
      client.options.headers["Authorization"] = "Bearer $token";
      
      print(formData);

      final response = await client.post(
        "http://10.0.2.2:8000/api/divorce/store",
        data: formData,
      );
      print(response);

    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data Perkawinan"),
        centerTitle: true,
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text('No. Akta Perceraian'),
              TextFormField(
                controller: _divorceNumberCtrl,
                decoration: InputDecoration(
                  hintText: 'No. Akta Perceraian'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'No. Akta Perceraian is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              Text('No. Akta Perkawinan'),
              TextFormField(
                controller: _maritalNumberCtrl,
                decoration: InputDecoration(
                  hintText: 'No. Akta Perkawinan'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'No. Akta Perkawinan is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('No. Serial Akta Perceraian'),
              TextFormField(
                controller: _divorceSerialCtrl,
                decoration: InputDecoration(
                  hintText: 'No. Serial Akta Perceraian'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'No. Serial Akta Perceraian is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tempat Perceraian'),
              TextFormField(
                controller: _divorcePlaceCtrl,
                decoration: InputDecoration(
                  hintText: 'Tempat Perceraian'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tempat Perceraian is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tanggal Perceraian'),
              TextFormField(
                controller: _divorceDateCtrl,
                decoration: InputDecoration(
                  hintText: 'mm-dd-yyyy'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tanggal Perceraian is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Nama Lengkap'),
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(
                  hintText: 'Nama Lengkap'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Nama is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('NIK'),
              TextFormField(
                controller: _nikCtrl,
                decoration: InputDecoration(
                  hintText: 'NIK'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'NIK is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tempat Lahir'),
              TextFormField(
                controller: _birthPlaceCtrl,
                decoration: InputDecoration(
                  hintText: 'Tempat Lahir'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tempat Lahir is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tanggal Lahir'),
              TextFormField(
                controller: _birthDateCtrl,
                decoration: InputDecoration(
                  hintText: 'mm-dd-yyyy'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tanggal Lahir is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Agama'),
              TextFormField(
                controller: _religionCtrl,
                decoration: InputDecoration(
                  hintText: 'Agama'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tempat Lahir is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Alamat'),
              TextFormField(
                controller: _addressCtrl,
                decoration: InputDecoration(
                  hintText: 'Alamat'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Alamat is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Container(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                      onPressed: () {
                        getImage();
                      },
                      child: Text(
                        "Bukti Akta Perceraian",
                      ),
                    ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_addFormKey.currentState.validate()) {
                    _addFormKey.currentState.save();
                    addData(
                      _divorceNumberCtrl.text,
                      _maritalNumberCtrl.text, 
                      _divorceSerialCtrl.text, 
                      _divorceDateCtrl.text, 
                      _divorcePlaceCtrl.text, 
                      _nameCtrl.text, 
                      _nikCtrl.text, 
                      _birthDateCtrl.text, 
                      _birthPlaceCtrl.text, 
                      _religionCtrl.text,  
                      _addressCtrl.text, 
                      _image,
                    );
                    Get.to(() => Home());
                    setState(() {
                      SnackBar(
                        content: Text('Add Data Successful'),
                        duration: Duration(seconds: 2),
                      );  
                    });
                  } else {
                    setState(() {
                      SnackBar(
                        content: Text('Failed to Add Data'),
                        duration: Duration(seconds: 2),
                      );  
                    });
                  }
                }, 
                child: Text(
                        "Add New Data",
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }

}

