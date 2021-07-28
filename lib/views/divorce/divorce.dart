import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/divorce_controller.dart';

class DivorcePage extends StatelessWidget {
  final DivorceController _controller = Get.put(DivorceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Perceraian"),
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
                "Action",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                )
              ),
            
          ], 
          rows: List.generate(_controller.divorceList.length, (index) {
            final x = _controller.divorceList[index].name;
            final y = _controller.divorceList[index].divorceNumber;

            return DataRow(cells: [
              DataCell(Container(child: Text(x),)),
              DataCell(Container(child: Text(y),)),
              DataCell(Container(child: Text("Detail"),)),
            ]);
          }),
          );
      }),
    );
  }
}