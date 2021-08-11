import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.nik,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.neighbourhood,
    this.position,
    this.avatar,
    this.roleId,
    this.googleId,
});

  int id;
  String nik;
  String name;
  String email;
  String password;
  String phone;
  String address;
  int neighbourhood;
  String position;
  String avatar;
  String roleId;
  String googleId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nik: json["nik"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    address: json["address"],
    neighbourhood: json["neighourhood_id"],
    position: json["position"],
    avatar: json["avatar"],
    roleId: json["role_id"],
    googleId: json["google_id"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nik": nik,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "address": address,
    "neighbourhood": neighbourhood,
    "position": position,
    "roleId": roleId,
    "google_id": googleId,
  };
}