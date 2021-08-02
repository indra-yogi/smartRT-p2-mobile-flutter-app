import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/divorce_controller.dart';
import 'package:p2_mobile_app/views/validation/val_detail_divorce.dart';

class ValidateDivorcePage extends StatelessWidget {
  final DivorceController _controller = Get.put(DivorceController());

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
          rows: List.generate(_controller.divorceVList.length, (index) {
            final x = _controller.divorceVList[index].name;
            final y = _controller.divorceVList[index].divorceNumber;

            return DataRow(cells: [
              DataCell(Container(child: Text(x),)),
              DataCell(Container(child: Text(y),)),
              DataCell(
                InkWell(
                  onTap: () {
                    Get.to(() => ValidateDetailDivorcePage(_controller.divorceVList[index]));
                  },child: Text("Detail"),)),
            ]);
          }),
          );
      }),
    );
  }
}