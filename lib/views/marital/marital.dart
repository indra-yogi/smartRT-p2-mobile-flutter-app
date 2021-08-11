import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/marital_controller.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/marital/add_marital.dart';
import 'package:p2_mobile_app/views/marital/detail_marital.dart';


class MaritalPage extends StatelessWidget {
  final MaritalController _controller = Get.put(MaritalController());

  final token = UserService().getToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Perkawinan"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {Get.to(() => AddDataMarital());},
              child: Icon(
                FontAwesomeIcons.plusCircle
              ),
            ),
          )
        ],
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
                  decoration: InputDecoration(
                    hintText: 'Search',
                    icon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(),
                  ),
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
                        "Action",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ),
                    
                  ], 
                  rows: List.generate(_controller.maritalList.length, (index) {
                    final x = _controller.maritalList[index].husbandName;
                    final y = _controller.maritalList[index].maritalNumber;

                    return DataRow(
                      color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (index % 2 == 0) {
                          return Colors.blueGrey[100].withOpacity(0.3);
                        } return null;
                      }),
                      cells: [
                      DataCell(Container(child: Text(x),)),
                      DataCell(Container(child: Text(y),)),
                      DataCell(Container(child: InkWell(onTap: () {Get.to(() => DetailMaritalPage(_controller.maritalList[index]),);}, child: Text("Detail"),),),),
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