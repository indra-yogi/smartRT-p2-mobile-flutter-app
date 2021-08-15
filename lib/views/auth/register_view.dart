import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:p2_mobile_app/http/url.dart';
import 'package:p2_mobile_app/model/location/city_model.dart';
import 'package:p2_mobile_app/model/location/district_model.dart';
import 'package:p2_mobile_app/model/location/neighbourhood_model.dart';
import 'package:p2_mobile_app/model/location/province_model.dart';
import 'package:p2_mobile_app/model/location/village_model.dart';
import 'package:p2_mobile_app/views/auth/login_view.dart';

class Register extends StatefulWidget {
  Register();

  @override
    _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();
  String baseUrl = 'http://10.0.2.2:8000/api/';
  int _valProvince; 
  int _valCity; 
  int _valDistrict;
  int _valVillage;
  int _valNeighbourhood;

  // ignore: deprecated_member_use
  List<Province> _dataProvince;
  List<City> _dataCity;
  List<District> _dataDistrict;
  List<Village> _dataVillage;
  List<Neighbourhood> _dataNeighbourhood;
  
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

  @override
  void initState() {
    super.initState();
    getProvince();
  }

  final _regFormKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirmation = TextEditingController();
  final _address = TextEditingController();
  final _nik = TextEditingController();  
  final _position = TextEditingController();


  register(
    String name, 
    String phone, 
    String email, 
    String nik, 
    String password, 
    String passwordConfirmation,
    String address, 
    String position,
    int _valNeighbourhood,
  ) async {
    Map data = {
      'name': name,
      'phone': phone,
      'email': email,
      'nik': nik,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'address': address,
      'position': position,
      'neighbourhood_id': _valNeighbourhood.toString()
    };

    var response = await http.post(Uri.parse(urlRegister),
      body: data
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonEncode(response.body);
      print(jsonResponse);
      Get.to(() => LoginPage());
    } else {
      print("The error is: ${response.body}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Form(
          key: _regFormKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text('Nama Lengkap'),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Nama Lengkap is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                Text('No. Telepon'),
                TextFormField(
                  controller: _phone,
                  decoration: InputDecoration(
                    hintText: '08123456789012'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'No. Telepon is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                Text('Email'),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: 'contoh123@gmail.com'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                Text('NIK'),
                TextFormField(
                  controller: _nik,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                SizedBox(height: 16.0),
                Text('Password'),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                Text('Password Confirmation'),
                TextFormField(
                  controller: _passwordConfirmation,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password Confirmation'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Password Confirmation is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                Text('Jabatan(Pekerjaan)'),
                TextFormField(
                  controller: _position,
                  decoration: InputDecoration(
                    hintText: 'Jabatan'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Jabatan is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                Text('Alamat'),
                TextFormField(
                  controller: _address,
                  decoration: InputDecoration(
                    hintText: 'Jl. Jln No. 01'
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Alamat is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
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
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if(_regFormKey.currentState.validate()) {
                      _regFormKey.currentState.save();

                      register(
                        _name.text, 
                        _phone.text, 
                        _email.text,
                        _nik.text, 
                        _password.text, 
                        _passwordConfirmation.text, 
                        _position.text,
                        _address.text,
                        _valNeighbourhood,
                      );
                      setState(() {
                       SnackBar(
                        content: Text('User Registered! Please Login!'),
                        duration: Duration(seconds: 2),    
                        );
                        Get.to(() => LoginPage());                        
                      });
                    }
                  }, 
                  child: Text('Submit'))
              ],
            ),
          ),
        ),
      );
  }
}