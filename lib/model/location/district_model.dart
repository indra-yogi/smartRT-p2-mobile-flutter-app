import 'dart:convert';

List<District> districtFromJson(String str) =>
    List<District>.from(json.decode(str).map((x) => District.fromJson(x)));

String districtToJson(List<District> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class District {
  District ({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}