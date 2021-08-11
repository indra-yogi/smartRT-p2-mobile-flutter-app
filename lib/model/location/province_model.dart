import 'dart:convert';

List<Province> provinceFromJson(String str) =>
    List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

String provinceToJson(List<Province> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Province {
  Province ({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}