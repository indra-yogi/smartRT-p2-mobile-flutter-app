import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

List<Role> roleFromJson(String str) =>
    List<Role>.from(json.decode(str)['role'].map((x) => Role.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String roleToJson(List<Role> data) =>
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
    this.role,
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
  int roleId;
  String googleId;
  Role role;

  factory User.fromJson(Map<String, dynamic> parsedJson) => User(
    id: parsedJson["id"],
    nik: parsedJson["nik"],
    name: parsedJson["name"],
    email: parsedJson["email"],
    password: parsedJson["password"],
    phone: parsedJson["phone"],
    address: parsedJson["address"],
    neighbourhood: parsedJson["neighourhood_id"],
    position: parsedJson["position"],
    avatar: parsedJson["avatar"],
    roleId: parsedJson["role_id"],
    googleId: parsedJson["google_id"],
    role: Role.fromJson(parsedJson['role'])
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
    "role": role,
  };
}

class Role {
  Role({
    this.id,
    this.name
  });

  int id;
  String name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}