import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/marital_controller.dart';
import 'package:p2_mobile_app/model/marital_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/validation/val_detail_marital.dart';

class ValidateMaritalPage extends StatefulWidget {
  @override
  _ValidateMaritalPageState createState() => _ValidateMaritalPageState();
}

class _ValidateMaritalPageState extends State<ValidateMaritalPage> {
  final MaritalController _controller = Get.put(MaritalController());

  final token = UserService().getToken();

  TextEditingController _searchController = TextEditingController();

  List<Marital> filteredMarital = [];

  String _searchResult = "";

  @override
  void initState() {
    super.initState();
    filteredMarital = _controller.maritalList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validasi Data Perkawinan"),
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
                      filteredMarital = _controller.maritalList.where((d) => 
                        d.husbandName.contains(_searchResult) || d.maritalNumber.contains(_searchResult)
                      ).toList();
                    });
                  },
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      "Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ),
                  DataColumn(
                    label: Text(
                      "No. Akta Perkawinan",
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
                rows: List.generate(filteredMarital.length, (index) {
                  final x = filteredMarital[index].husbandName;
                  final y = filteredMarital[index].maritalNumber;
                  final z = filteredMarital[index].status.status;

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
                    DataCell(Container(child: InkWell(onTap: () {Get.to(() => ValidateDetailMaritalPage(_controller.maritalList[index]),);}, child: Text("Detail"),),),),
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