import 'dart:convert';

List<Village> villageFromJson(String str) =>
    List<Village>.from(json.decode(str).map((x) => Village.fromJson(x)));

String villageToJson(List<Village> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Village {
  Village ({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Village.fromJson(Map<String, dynamic> json) => Village(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}