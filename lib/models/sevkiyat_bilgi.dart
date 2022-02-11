// To parse this JSON data, do
//
//     final SevkiyatBilgi = SevkiyatBilgiFromJson(jsonString);

import 'dart:convert';

SevkiyatBilgi sevkiyatBilgiFromJson(String str) =>
    SevkiyatBilgi.fromJson(json.decode(str));

String sevkiyatBilgiToJson(SevkiyatBilgi data) => json.encode(data.toJson());

class SevkiyatBilgi {
  SevkiyatBilgi({
    required this.sevkiyatId,
    required this.proje,
    required this.plaka,
    required this.sevkiyatNumara,
    this.olusturulmaTarihi,
    this.olusturanUserId,
    required this.isActive,
    this.sevkiyatPhotoPath,
    this.sevkiyatciId,
    this.guncellemeTarihi,
    this.guncelleyenUserId,
    this.guncelleyenUser,
    this.olusturanUser,
    this.sevkiyatci,
  });

  int sevkiyatId;
  String proje;
  dynamic plaka;
  String sevkiyatNumara;
  dynamic olusturulmaTarihi;
  dynamic olusturanUserId;
  bool isActive;
  dynamic sevkiyatPhotoPath;
  dynamic sevkiyatciId;
  dynamic guncellemeTarihi;
  dynamic guncelleyenUserId;
  dynamic guncelleyenUser;
  dynamic olusturanUser;
  dynamic sevkiyatci;

  factory SevkiyatBilgi.fromJson(Map<String, dynamic> json) => SevkiyatBilgi(
        sevkiyatId: json["sevkiyatId"],
        proje: json["proje"],
        plaka: json["plaka"],
        sevkiyatNumara: json["sevkiyatNumara"],
        olusturulmaTarihi: json["olusturulmaTarihi"],
        olusturanUserId: json["olusturanUserId"],
        isActive: json["isActive"],
        sevkiyatPhotoPath: json["sevkiyatPhotoPath"],
        sevkiyatciId: json["sevkiyatciId"],
        guncellemeTarihi: json["guncellemeTarihi"],
        guncelleyenUserId: json["guncelleyenUserId"],
        guncelleyenUser: json["guncelleyenUser"],
        olusturanUser: json["olusturanUser"],
        sevkiyatci: json["sevkiyatci"],
      );

  Map<String, dynamic> toJson() => {
        "sevkiyatId": sevkiyatId,
        "proje": proje,
        "plaka": plaka,
        "sevkiyatNumara": sevkiyatNumara,
        "olusturulmaTarihi": olusturulmaTarihi,
        "olusturanUserId": olusturanUserId,
        "isActive": isActive,
        "sevkiyatPhotoPath": sevkiyatPhotoPath,
        "sevkiyatciId": sevkiyatciId,
        "guncellemeTarihi": guncellemeTarihi,
        "guncelleyenUserId": guncelleyenUserId,
        "guncelleyenUser": guncelleyenUser,
        "olusturanUser": olusturanUser,
        "sevkiyatci": sevkiyatci,
      };
}
