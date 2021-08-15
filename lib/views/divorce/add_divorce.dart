import 'package:dio/dio.dart' as dio;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/location/city_model.dart';
import 'package:p2_mobile_app/model/location/district_model.dart';
import 'package:p2_mobile_app/model/location/neighbourhood_model.dart';
import 'package:p2_mobile_app/model/location/province_model.dart';
import 'package:p2_mobile_app/model/location/village_model.dart';
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

  DateTime selectedDate;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  int _valProvince; 
  int _valCity; 
  int _valDistrict;
  int _valVillage;
  int _valNeighbourhood;

  List<Province> _dataProvince;
  List<City> _dataCity;
  List<District> _dataDistrict;
  List<Village> _dataVillage;
  List<Neighbourhood> _dataNeighbourhood;

  var client = http.Client();
  final picker = ImagePicker();
  final divorceService = DivorceService();
  final _addFormKey = GlobalKey<FormState>();
  final _divorceNumberCtrl = TextEditingController();
  final _maritalNumberCtrl = TextEditingController();
  final _divorceSerialCtrl = TextEditingController();
  final _divorceDateCtrl = TextEditingController();
  final _divorcePlaceCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _nikCtrl = TextEditingController();
  final _birthDateCtrl = TextEditingController();
  final _birthPlaceCtrl = TextEditingController();
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
            print('Pilih Image, Size max 2Mb');
          }
        });
  }

  void getProvince() async {
    final response = await http.get(Uri.parse(urlGetProvince));
    var listData = provinceFromJson(response.body);
    setState(() {
      _dataProvince = listData;
    });
    print("data : $listData");
  }

  void getCity(int id) async {
    final response = await http.get(Uri.parse("https://api.smartrtpp.xyz/api/location?type=city&provinceId=$id"));
    var listData = cityFromJson(response.body);
    setState(() {
      _dataCity = listData;      
    });
    print("data : $listData");
  }

  void getDistrict(int id) async {
    final response = await http.get(Uri.parse("https://api.smartrtpp.xyz/api/location?type=district&cityId=$id"));
    var listData = districtFromJson(response.body);
    setState(() {
      _dataDistrict = listData;      
    });
    print("data : $listData");
  }

  void getVillage(int id) async {
    final response = await http.get(Uri.parse("https://api.smartrtpp.xyz/api/location?type=village&districtId=$id"));
    var listData = villageFromJson(response.body);
    setState(() {
      _dataVillage = listData;      
    });
    print("data : $listData");
  }

  void getNeighbourhood(int id) async {
    final response = await http.get(Uri.parse("https://api.smartrtpp.xyz/api/location?type=neighbourhood&villageId=$id"));
    var listData = neighbourhoodFromJson(response.body);
    setState(() {
      _dataNeighbourhood = listData;      
    });
    print("data : $listData");
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
    int _valNeighbourhood,
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
        'neighbourhood_id': _valNeighbourhood,
        'attachment': await dio.MultipartFile.fromFile(
          _image.path,
          filename: fileName,
          //contentType: MediaType("image", ""),
        ),
      });
      String token = await UserService().getToken();
      dio.Dio client = new dio.Dio();
      client.options.headers["Authorization"] = token;
      
      print(formData);

      final response = await client.post(
        "https://api.smartrtpp.xyz/api/divorce",
        data: formData,
      );
      print(response);
    }

    _selectDivorceDate() async {
      final DateTime picked = await showDatePicker (
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970),
        lastDate: DateTime.now(),
      );
      setState(() {
        selectedDate = picked ?? selectedDate;        
      });
    }
  
  @override
  void initState() {
    super.initState();
    getProvince();
    selectedDate = DateTime.now();
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
              InkWell(
                onTap: () => _selectDivorceDate(),
                child: IgnorePointer(
                  child: TextField(
                    controller: _divorceDateCtrl,
                    decoration: InputDecoration(
                      hintText: ('${dateFormat.format(selectedDate)}'),
                    ),
                  ),
                ),
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
              InkWell(
                onTap: () => _selectDivorceDate(),
                child: IgnorePointer(
                  child: TextField(
                    controller: _birthDateCtrl,
                    decoration: InputDecoration(
                      hintText: ('${dateFormat.format(selectedDate)}'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0,),
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
              Text('Provinsi'),
                DropdownButton<int>(
                hint: Text("Pilih Provinsi"),
                value: _valProvince,
                items: _dataProvince?.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id,
                  );
                })?.toList(),
                onChanged: (value) {
                  setState(() {
                    _valProvince = value;
                    _valCity = null;
                  });
                  getCity(value);
                },
              ),
              SizedBox(height: 16.0),
              Text('Kota'),
               DropdownButton<int>(
                  hint: Text("Pilih Kota"),
                  value: _valCity,
                  items: _dataCity?.map((item) {
                    return DropdownMenuItem(
                      child: Text(item.name),
                      value: item.id 
                    );
                  })?.toList(),
                  onChanged: (value) {
                    setState(() {
                      _valCity = value;
                      _valDistrict = null;                      
                    });
                  getDistrict(value);
                  },
            ),
            SizedBox(height: 16.0),
            Text('Kecamatan'),
              DropdownButton(
                hint: Text("Pilih Kecamatan"),
                value: _valDistrict,
                items: _dataDistrict?.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id,
                  );
                })?.toList(),
                onChanged: (value) {
                  setState(() {
                    _valDistrict = value;
                    _valVillage = null;                      
                  });
                  getVillage(value);
                },
              ),
            SizedBox(height: 16.0),
            Text('Kelurahan'),
              DropdownButton(
                hint: Text("Pilih Kelurahan"),
                value: _valVillage,
                items: _dataVillage?.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id,
                  );
                })?.toList(),
                onChanged: (value) {
                  setState(() {
                    _valVillage = value;
                    _valNeighbourhood = null;                      
                  });
                  getNeighbourhood(value);
                },
              ),
            SizedBox(height: 16.0),
            Text('RT'),
              DropdownButton(
                hint: Text("Pilih RT"),
                value: _valNeighbourhood,
                items: _dataNeighbourhood?.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id,
                  );
                })?.toList(),
                onChanged: (value) {
                  setState(() {
                    _valNeighbourhood = value;                     
                  });
                },    
              ),
            SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: _image == null
                ? Text('Pilih Image, Size max 2Mb')
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
                      _valNeighbourhood, 
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

