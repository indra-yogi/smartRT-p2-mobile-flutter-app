import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/divorce_controller.dart';
import 'package:p2_mobile_app/model/divorce_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/validation/val_detail_divorce.dart';

class ValidateDivorcePage extends StatefulWidget {
  @override
  _ValidateDivorcePageState createState() => _ValidateDivorcePageState();
}

class _ValidateDivorcePageState extends State<ValidateDivorcePage> {
  final DivorceController _controller = Get.put(DivorceController());

  final token = UserService().getToken();
  TextEditingController _searchController = TextEditingController();
  List<Divorce> filteredDivorce = [];
  String _searchResult = "";

  @override
  void initState() {
    super.initState();
    filteredDivorce = _controller.divorceList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validasi Data Perceraian"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return InteractiveViewer(
          constrained: false,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                width: 420.0,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    icon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchResult = value;
                      filteredDivorce = _controller.divorceList.where((d) => 
                        d.name.contains(_searchResult) || d.divorceNumber.contains(_searchResult)
                      ).toList();
                    });
                  },
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      "Nama",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ),
                  DataColumn(
                    label: Text(
                      "No. Akta Perceraian",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ),
                  DataColumn(
                    label: Text(
                      "Status",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ),
                  DataColumn(
                    label: Text(
                      "Action",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ),
                  
                ], 
                rows: List.generate(filteredDivorce.length, (index) {
                  final x = filteredDivorce[index].name;
                  final y = filteredDivorce[index].divorceNumber;
                  final z = filteredDivorce[index].status.status;

                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (index % 2 == 0) {
                          return Colors.blueGrey[100].withOpacity(0.3);
                        } return null;
                      }),
                    cells: [
                    DataCell(Container(child: Text(x),)),
                    DataCell(Container(child: Text(y),)),
                    DataCell(Container(child: Text(z),)),
                    DataCell(
                      InkWell(
                        onTap: () {
                          Get.to(() => ValidateDetailDivorcePage(filteredDivorce[index]));
                        },child: Text("Detail"),)),
                  ]);
                }),
                ),
            ],
          ),
        );
      }),
    );
  }
}