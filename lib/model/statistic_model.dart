import 'dart:convert';

List<Statistic> statisticFromJson(String str) =>
    List<Statistic>.from(json.decode(str).map((x) => Statistic.fromJson(x)));

    String statisticToJson(List<Statistic> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Statistic {
  Statistic({
    this.name,
    this.value,
    this.percentageValue,
  });

  int name;
  int value;
  double percentageValue;

  factory Statistic.fromJson(Map<String, dynamic> parsedJson) => Statistic(
    name: parsedJson["name"],
    value: parsedJson["value"],
    percentageValue: parsedJson["percentage_value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
    "percentage_value": percentageValue,
  };

}