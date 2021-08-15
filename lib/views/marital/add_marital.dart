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
import 'package:p2_mobile_app/service/marital_service.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:p2_mobile_app/views/home/home.dart';
//import 'package:p2_mobile_app/views/marital/marital.dart';


class AddDataMarital extends StatefulWidget {
  AddDataMarital();
  
  @override
    _AddDataMaritalState createState() => _AddDataMaritalState();
}

class _AddDataMaritalState extends State<AddDataMarital> {
  _AddDataMaritalState();

  DateTime selectedMaritalDate;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

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

  var client = http.Client();
  final picker = ImagePicker();
  final maritalService = MaritalService();
  final _addFormKey = GlobalKey<FormState>();
  final _maritalNumberCtrl = TextEditingController();
  final _maritalSerialCtrl = TextEditingController();
  final _marriedPlaceCtrl = TextEditingController();
  final _marriedDateCtrl = TextEditingController();
  final _husbandNameCtrl = TextEditingController();
  final _husbandNikCtrl = TextEditingController();
  final _husbandBirthPlaceCtrl = TextEditingController();
  final _husbandBirthDateCtrl = TextEditingController();
  final _husbandNationalityCtrl = TextEditingController();
  final _husbandReligionCtrl = TextEditingController();
  final _wifeNameCtrl = TextEditingController();
  final _wifeNikCtrl = TextEditingController();
  final _wifeBirthPlaceCtrl = TextEditingController();
  final _wifeBirthDateCtrl = TextEditingController();
  final _wifeNationalityCtrl = TextEditingController();
  final _wifeReligionCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final token = UserService().getToken();

  String maritalNumber;
  String maritalSerial;
  String marriedDate;
  String marriedPlace;
  String husbandName;
  String husbandNik;
  String husbandBirthDate;
  String husbandBirthPlace;
  String husbandReligion;
  String husbandNationality;
  String wifeName;
  String wifeNik;
  String wifeBirthDate;
  String wifeBirthPlace;
  String wifeReligion;
  String wifeNationality;
  String address;
  File _image;
  File _imageHusband;
  File _imageWife;

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

  Future getImageHusband() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 100,
      maxWidth: 120,
    );

    setState(() {
          if (pickedFile != null) {
            _imageHusband = File(pickedFile.path);
          } else {
            print('No image selected');
          }
        });
  }

  Future getImageWife() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 100,
      maxWidth: 120,
    );

    setState(() {
          if (pickedFile != null) {
            _imageWife = File(pickedFile.path);
          } else {
            print('No image selected');
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
    String maritalNumber,
    String maritalSerial,
    String marriedDate,
    String marriedPlace,
    String husbandName,
    String husbandNik,
    String husbandBirthDate,
    String husbandBirthPlace,
    String husbandReligion,
    String husbandNationality,
    String wifeName,
    String wifeNik,
    String wifeBirthDate,
    String wifeBirthPlace,
    String wifeReligion,
    String wifeNationality,
    String address,
    int _valNeighbourhood,
    File _image,
    File _imageHusband,
    File _imageWife,

  ) async {
      String fileName = _image.path.split('/').last;
      String fileNameHusband = _imageHusband.path.split('/').last;
      String fileNameWife = _imageWife.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'marital_number': maritalNumber,
        'marital_serial_number': maritalSerial,
        'married_date': selectedMaritalDate,
        'married_place': marriedPlace,
        'husband_name': husbandName,
        'husband_nik': husbandNik,
        'husband_birth_date': husbandBirthDate,
        'husband_birth_place': husbandBirthPlace,
        'husband_nationality': husbandNationality,
        'husband_religion': husbandReligion,
        'wife_name': wifeName,
        'wife_nik': wifeNik,
        'wife_birth_date': wifeBirthDate,
        'wife_birth_place': wifeBirthPlace,
        'wife_nationality': wifeNationality,
        'wife_religion': wifeReligion,
        'address': address,
        'neighbourhood_id': _valNeighbourhood,
        'marital_attachment': await dio.MultipartFile.fromFile(
          _image.path,
          filename: fileName,
          //contentType: MediaType("image", ""),
        ),
        'husband_marital_attachment': await dio.MultipartFile.fromFile(
          _imageHusband.path,
          filename: fileNameHusband,
          //contentType: MediaType("image", ""),
        ),
        'wife_marital_attachment': await dio.MultipartFile.fromFile(
          _imageWife.path,
          filename: fileNameWife,
          //contentType: MediaType("image", ""),
        ),
      });
      String token = await UserService().getToken();
      dio.Dio client = new dio.Dio();
      client.options.headers["Authorization"] = token;
      
      print(formData);

      final response = await client.post(
        "https://api.smartrtpp.xyz/api/marital",
        data: formData,
      );
      print(response);

    }

    _selectMarriedDate() async {
      final DateTime picked = await showDatePicker (
        context: context,
        initialDate: selectedMaritalDate,
        firstDate: DateTime(1970),
        lastDate: DateTime.now(),
      );
      setState(() {
        selectedMaritalDate = picked ?? selectedMaritalDate;        
      });
    }

  @override
  void initState() {
    super.initState();
    getProvince();
    selectedMaritalDate = DateTime.now();
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
              Text('No. Serial Akta Perkawinan'),
              TextFormField(
                controller: _maritalSerialCtrl,
                decoration: InputDecoration(
                  hintText: 'No. Serial Akta Perkawinan'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'No. Serial Akta Perkawinan is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tempat Perkawinan'),
              TextFormField(
                controller: _marriedPlaceCtrl,
                decoration: InputDecoration(
                  hintText: 'Tempat Perkawinan'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tempat Perkawinan is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tanggal Perkawinan'),
              InkWell(
                onTap: () => _selectMarriedDate(),
                child: IgnorePointer(
                  child: TextField(
                    controller: _marriedDateCtrl,
                    decoration: InputDecoration(
                      hintText: ('${dateFormat.format(selectedMaritalDate)}'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              Text('Nama Suami'),
              TextFormField(
                controller: _husbandNameCtrl,
                decoration: InputDecoration(
                  hintText: 'Nama Suami'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Nama Suami is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('NIK Suami'),
              TextFormField(
                controller: _husbandNikCtrl,
                decoration: InputDecoration(
                  hintText: 'NIK Suami'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'NIK Suami is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tempat Lahir Suami'),
              TextFormField(
                controller: _husbandBirthPlaceCtrl,
                decoration: InputDecoration(
                  hintText: 'Tempat Lahir Suami'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tempat Lahir Suami is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tanggal Lahir Suami'),
              InkWell(
                onTap: () => _selectMarriedDate(),
                child: IgnorePointer(
                  child: TextField(
                    controller: _husbandBirthDateCtrl,
                    decoration: InputDecoration(

                      hintText: ('${dateFormat.format(selectedMaritalDate)}'),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              Text('Kewarganegaraan Suami'),
              TextFormField(
                controller: _husbandNationalityCtrl,
                decoration: InputDecoration(
                  hintText: 'Kewarganegaraan Suami'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Kewarganegaraan Suami is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Agama Suami'),
              TextFormField(
                controller: _husbandReligionCtrl,
                decoration: InputDecoration(
                  hintText: 'Agama Suami'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Agama Suami is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Nama Istri'),
              TextFormField(
                controller: _wifeNameCtrl,
                decoration: InputDecoration(
                  hintText: 'Nama Istri'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Nama Istri is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ), 
              SizedBox(height: 16.0,),
              Text('NIK Istri'),
              TextFormField(
                controller: _wifeNikCtrl,
                decoration: InputDecoration(
                  hintText: 'NIK Istri'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'NIK Istri is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tempat Lahir Istri'),
              TextFormField(
                controller: _wifeBirthPlaceCtrl,
                decoration: InputDecoration(
                  hintText: 'Tempat Lahir Istri'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Tempat Lahir Istri is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Tanggal Lahir Istri'),
              InkWell(
                onTap: () => _selectMarriedDate(),
                child: IgnorePointer(
                  child: TextField(
                    controller: _wifeBirthDateCtrl,
                    decoration: InputDecoration(

                      hintText: ('${dateFormat.format(selectedMaritalDate)}'),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              Text('Kewarganegaraan Istri'),
              TextFormField(
                controller: _wifeNationalityCtrl,
                decoration: InputDecoration(
                  hintText: 'Kewarganegaraan Istri'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Kewarganegaraan Istri is required';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0,),
              Text('Agama Istri'),
              TextFormField(
                controller: _wifeReligionCtrl,
                decoration: InputDecoration(
                  hintText: 'Agama Istri'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Agama Istri is required';
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
            SizedBox(height: 16.0),
            Container(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: _image == null
                ? Text('Image, Size max 2MB')
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
                        "Bukti Akta Pernikahan",
                      ),
                    ),
              SizedBox(
                height: 20.0,
                ),
              Container(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: _imageHusband == null
                ? Text('Image, Size max 2MB')
                : Image.file(_imageHusband),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                      onPressed: () {
                        getImageHusband();
                      },
                      child: Text(
                        "Bukti Buku Nikah Suami",
                      ),
                    ),
              SizedBox(
                height: 20.0,
                ),
              Container(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: _imageWife == null
                ? Text('Image, Size max 2MB')
                : Image.file(_imageWife),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                      onPressed: () {
                        getImageWife();
                      },
                      child: Text(
                        "Bukti Buku Nikah Istri",
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
                      _maritalNumberCtrl.text, 
                      _maritalSerialCtrl.text, 
                      _marriedDateCtrl.text, 
                      _marriedPlaceCtrl.text, 
                      _husbandNameCtrl.text, 
                      _husbandNikCtrl.text, 
                      _husbandBirthDateCtrl.text, 
                      _husbandBirthPlaceCtrl.text, 
                      _husbandReligionCtrl.text, 
                      _husbandNationalityCtrl.text, 
                      _wifeNameCtrl.text, 
                      _wifeNikCtrl.text, 
                      _wifeBirthDateCtrl.text, 
                      _wifeBirthPlaceCtrl.text, 
                      _wifeReligionCtrl.text, 
                      _wifeNationalityCtrl.text, 
                      _addressCtrl.text,
                      _valNeighbourhood, 
                      _image, 
                      _imageHusband, 
                      _imageWife
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

