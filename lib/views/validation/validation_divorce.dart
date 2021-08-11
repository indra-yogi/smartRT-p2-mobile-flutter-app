import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/divorce_controller.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/validation/val_detail_divorce.dart';

class ValidateDivorcePage extends StatelessWidget {
  final DivorceController _controller = Get.put(DivorceController());

  final token = UserService().getToken();

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
          child: DataTable(
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

              return DataRow(
                color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (index % 2 == 0) {
                      return Colors.blueGrey[100].withOpacity(0.3);
                    } return null;
                  }),
                cells: [
                DataCell(Container(child: Text(x),)),
                DataCell(Container(child: Text(y),)),
                DataCell(
                  InkWell(
                    onTap: () {
                      Get.to(() => ValidateDetailDivorcePage(_controller.divorceVList[index]));
                    },child: Text("Detail"),)),
              ]);
            }),
            ),
        );
      }),
    );
  }
}