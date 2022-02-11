// To parse this JSON data, do
//
//     final sevkiyatKullanicilar = sevkiyatKullanicilarFromJson(jsonString);

import 'dart:convert';

SevkiyatKullanicilar sevkiyatKullanicilarFromJson(String str) =>
    SevkiyatKullanicilar.fromJson(json.decode(str));

String sevkiyatKullanicilarToJson(SevkiyatKullanicilar data) =>
    json.encode(data.toJson());

class SevkiyatKullanicilar {
  SevkiyatKullanicilar({
    this.userId,
    required this.userName,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.isAdmin,
    this.profilePhotoPath,
    required this.isActive,
    this.sevkiyatBilgiGuncelleyenUsers,
    this.sevkiyatBilgiOlusturanUsers,
    this.sevkiyatBilgiSevkiyatcis,
  });

  dynamic userId;
  String userName;
  String name;
  String surname;
  String email;
  String password;
  bool isAdmin;
  dynamic profilePhotoPath;
  bool isActive;
  dynamic sevkiyatBilgiGuncelleyenUsers;
  dynamic sevkiyatBilgiOlusturanUsers;
  dynamic sevkiyatBilgiSevkiyatcis;

  factory SevkiyatKullanicilar.fromJson(Map<String, dynamic> json) =>
      SevkiyatKullanicilar(
        userId: json["userId"],
        userName: json["userName"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        profilePhotoPath: json["profilePhotoPath"],
        isActive: json["isActive"],
        sevkiyatBilgiGuncelleyenUsers: List<dynamic>.from(
            json["sevkiyatBilgiGuncelleyenUsers"].map((x) => x)),
        sevkiyatBilgiOlusturanUsers: List<dynamic>.from(
            json["sevkiyatBilgiOlusturanUsers"].map((x) => x)),
        sevkiyatBilgiSevkiyatcis:
            List<dynamic>.from(json["sevkiyatBilgiSevkiyatcis"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "profilePhotoPath": profilePhotoPath,
        "isActive": isActive,
        "sevkiyatBilgiGuncelleyenUsers":
            List<dynamic>.from(sevkiyatBilgiGuncelleyenUsers.map((x) => x)),
        "sevkiyatBilgiOlusturanUsers":
            List<dynamic>.from(sevkiyatBilgiOlusturanUsers.map((x) => x)),
        "sevkiyatBilgiSevkiyatcis":
            List<dynamic>.from(sevkiyatBilgiSevkiyatcis.map((x) => x)),
      };
}
