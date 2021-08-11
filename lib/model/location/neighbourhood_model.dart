import 'dart:convert';

List<Neighbourhood> neighbourhoodFromJson(String str) =>
    List<Neighbourhood>.from(json.decode(str).map((x) => Neighbourhood.fromJson(x)));

String neighbourhoodToJson(List<Neighbourhood> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Neighbourhood {
  Neighbourhood ({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Neighbourhood.fromJson(Map<String, dynamic> json) => Neighbourhood(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}