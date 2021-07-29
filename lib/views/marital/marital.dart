import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/marital_controller.dart';
import 'package:p2_mobile_app/views/marital/detail_marital.dart';

class MaritalPage extends StatelessWidget {
  final MaritalController _controller = Get.put(MaritalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Perkawinan"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return DataTable(
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

            return DataRow(cells: [
              DataCell(Container(child: Text(x),)),
              DataCell(Container(child: Text(y),)),
              DataCell(Container(child: InkWell(onTap: () {Get.to(() => DetailMaritalPage(_controller.maritalList[index]),);}, child: Text("Detail"),),),),
            ]);
          }),
          );
      }),
    );
  }
}