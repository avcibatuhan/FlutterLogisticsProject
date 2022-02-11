import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/globals.dart';
import 'package:pokedex/models/sevkiyat_bilgi.dart';
import 'package:pokedex/models/sevkiyat_kullanicilar.dart';
import 'package:pokedex/models/userinfo.dart';

class Api {
  String url = "YOUR_DOMAIN_HERE/api/Sevkiyat_Kullanicilar";

  Future<UserInfo?> login(username, sifre) async {
    String body = json.encode({'Username': username, 'Password': sifre});
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/login'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        var result = UserInfo.fromJson(response.body);
        userInfoG = result;
        return result;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<SevkiyatBilgi>> getAllSevkiyat() async {
    List<SevkiyatBilgi> sevkiyatBilgiList = [];
    try {
      var response2 = await Dio().get('$url/sevkiyat');
      print(userInfoG!.token);
      if (response2.statusCode == 200) {
        sevkiyatBilgiList = (response2.data as List)
            .map((e) => SevkiyatBilgi.fromJson(e))
            .toList();
      }
      return sevkiyatBilgiList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<List<SevkiyatKullanicilar>> getAllUsers() async {
    List<SevkiyatKullanicilar> sevkiyatKullanicilarList = [];
    try {
      var response2 = await Dio().get('$url/kullanicilar');
      if (response2.statusCode == 200) {
        sevkiyatKullanicilarList = (response2.data as List)
            .map((e) => SevkiyatKullanicilar.fromJson(e))
            .toList();
      }
      return sevkiyatKullanicilarList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<SevkiyatBilgi> getSevkiyatById(int id) async {
    late SevkiyatBilgi sevkiyatBilgi;
    try {
      var response = await Dio().get('$url/sevkiyat/$id');
      if (response.statusCode == 200) {
        sevkiyatBilgi = SevkiyatBilgi.fromJson(response.data);
      }
      return sevkiyatBilgi;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<SevkiyatKullanicilar> getKullaniciById(int id) async {
    late SevkiyatKullanicilar sevkiyatKullanicilar;
    try {
      var response = await Dio().get('$url/kullanici/$id');
      if (response.statusCode == 200) {
        sevkiyatKullanicilar = SevkiyatKullanicilar.fromJson(response.data);
      }
      return sevkiyatKullanicilar;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<bool?> addSevkiyat(
      String proje, String sevkiyatNumarasi, tarih, userId) async {
    tarih = tarih.toString();
    String gonderilecekTarih = tarih.toString();
    gonderilecekTarih = gonderilecekTarih.replaceAll(RegExp(r' '), 'T');
    String body = json.encode({
      'Proje': proje,
      'SevkiyatNumara': sevkiyatNumarasi,
      'OlusturulmaTarihi': gonderilecekTarih,
      'OlusturanUserId': userId,
    });
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/addSevkiyat'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool?> updateSevkiyat(String plaka, String proje,
      String sevkiyatNumarasi, tarih, userId, sevkiyatId) async {
    tarih = tarih.toString();
    String gonderilecekTarih = tarih.toString();
    gonderilecekTarih = gonderilecekTarih.replaceAll(RegExp(r' '), 'T');
    String body = json.encode({
      'Plaka': plaka,
      'Proje': proje,
      'SevkiyatNumara': sevkiyatNumarasi,
      'OlusturulmaTarihi': gonderilecekTarih,
      'GuncelleyenUserId': userId,
    });
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/sevkiyat/$sevkiyatId'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool?> changePassword(String oldPw, String newPw) async {
    String body = json.encode({
      'oldPassword': oldPw,
      'newPassword': newPw,
    });
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/changePassword/${userInfoG!.userId}'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool?> updateProfile(
      String userName, String name, String surname, email, userId) async {
    String body = json.encode({
      'UserName': userName,
      'Name': name,
      'SurName': surname,
      'Email': email,
    });
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/kullanici/$userId'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        var result = UserInfo.fromJson(response.body);

        userInfoG!.name = result.name;
        userInfoG!.email = result.email;
        userInfoG!.surname = result.surname;
        userInfoG!.userName = result.userName;

        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool?> updateUser(String userName, String name, String surname, email,
      bool isActive, userId) async {
    String body = json.encode({
      'UserName': userName,
      'Name': name,
      'SurName': surname,
      'Email': email,
      'IsActive': isActive,
    });
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/kullanici/$userId'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool?> changeUserActivity(userId) async {
    String body = json.encode({
      'GuncelleyenUserId': userId,
    });
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/changeKullanici/$userId'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool?> addKullanici(
      name, surname, email, userName, isAdmin, password) async {
    String body = json.encode({
      'Username': userName,
      'Name': name,
      'Surname': surname,
      'Email': email,
      'isAdmin': isAdmin,
      'Password': password,
    });
    try {
      http.Response response = await http.post(
        Uri.parse('${url}/addKullanici'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
