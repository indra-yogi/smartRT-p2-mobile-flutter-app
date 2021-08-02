import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/marital_controller.dart';
import 'package:p2_mobile_app/views/validation/val_detail_marital.dart';

class ValidateMaritalPage extends StatelessWidget {
  final MaritalController _controller = Get.put(MaritalController());

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
          rows: List.generate(_controller.maritalVList.length, (index) {
            final x = _controller.maritalVList[index].husbandName;
            final y = _controller.maritalVList[index].maritalNumber;

            return DataRow(cells: [
              DataCell(Container(child: Text(x),)),
              DataCell(Container(child: Text(y),)),
              DataCell(Container(child: InkWell(onTap: () {Get.to(() => ValidateDetailMaritalPage(_controller.maritalVList[index]),);}, child: Text("Detail"),),),),
            ]);
          }),
          );
      }),
    );
  }
}