import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/controller/statistic_controller.dart';
import 'package:p2_mobile_app/model/statistic_model.dart';
import 'package:p2_mobile_app/views/auth/login_view.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticPage extends StatefulWidget {
  @override
    StatisticPageState createState() => StatisticPageState(); 
}

class StatisticPageState extends State<StatisticPage> {
  final StatisticController _controller = Get.put(StatisticController());

  List<Statistic> statisticData = [];
  List<Statistic> statisticDivorce = [];

  final Map<String, double> dataMap = {};
  final Map<String, double> divorceMap = {};

  List<Color> colorList = [
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent
  ];

   List<Color> colorList2 = [
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent
  ];

  int key = 0;
  int dKey = 1;


  @override
  void initState() { 
    statisticData = _controller.maritalData;
    statisticDivorce = _controller.divorceData;
    super.initState(); 
  }

  Map<String, double> getChartDataMap() {
    statisticData.forEach((element) {
      dataMap[element.name.toString()] = element.percentageValue;
    });
    return dataMap;
  }

  Map<String, double> getChartDivorceMap() {
    statisticDivorce.forEach((element) {
      divorceMap[element.name.toString()] = element.percentageValue;
     });
     return divorceMap;
  }

  Widget pieChartMarital(BuildContext context) {
    return PieChart(
        dataMap: getChartDataMap(),
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 1.5,
        colorList: colorList,
        initialAngleInDegree: 0,
        legendOptions: LegendOptions(
        showLegends: true,
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true, 
      ),
      ringStrokeWidth: 32,
      emptyColor: Colors.grey,
    );
  }

  Widget pieChartDivorce(BuildContext context) {
    return PieChart(
        dataMap: getChartDivorceMap(),
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 1.5,
        colorList: colorList2,
        initialAngleInDegree: 0,
        legendOptions: LegendOptions(
        showLegends: true,
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true, 
      ),
      ringStrokeWidth: 32,
      emptyColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aplikasi SmartRT P2'),
        automaticallyImplyLeading: false,
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
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Data Perkawinan",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                pieChartMarital(context),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 50.0, 
                  child: Container(),
                ),
                Text("Data Perceraian",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                pieChartDivorce(context),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (() {
          Get.to(() => LoginPage());
        }), 
        label: Text("Login"),
        icon: Icon(Icons.login),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}