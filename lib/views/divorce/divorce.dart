import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/divorce_controller.dart';
import 'package:p2_mobile_app/service/user_service.dart';
import 'package:p2_mobile_app/views/divorce/add_divorce.dart';
import 'package:p2_mobile_app/views/divorce/detail_divorce.dart';


class DivorcePage extends StatefulWidget {
  @override
  _DivorcePageState createState() => _DivorcePageState();
}

class _DivorcePageState extends State<DivorcePage> {
  final DivorceController _controller = Get.put(DivorceController());

  final token = UserService().getToken();
  TextEditingController _searchController = TextEditingController();

  String _searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Perceraian"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {Get.to(() => AddDataDivorce());},
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        Get.to(() => DetailDivorcePage(_controller.divorceList[index]));
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