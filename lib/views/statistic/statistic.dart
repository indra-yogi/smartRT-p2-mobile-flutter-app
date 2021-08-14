import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_mobile_app/views/auth/login_view.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticPage extends StatefulWidget {
  @override
    StatisticPageState createState() => StatisticPageState(); 
}

class StatisticPageState extends State<StatisticPage> {
  Map<String, double> dataMap = {
    "2017": 30,
    "2018": 60,
    "2019": 20,
    "2020": 10,
    "2021": 70,
  };

  List<Color> colorList = [
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent
  ];

  int key = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aplikasi SmartRT P2'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
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
              SizedBox(height: 16.0,),
              PieChart(
                key: ValueKey(key),
                dataMap: dataMap,
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
              ),
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
              SizedBox(
                height: 16.0,
              ),
              PieChart(
                dataMap: dataMap,
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
              ),
            ],
          ),
        ),
      ),
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