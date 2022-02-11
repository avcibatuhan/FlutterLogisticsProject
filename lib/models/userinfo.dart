import 'dart:convert';

class UserInfo {
  bool isAdmin;
  final int userId;
  String userName;
  String name;
  String surname;
  String email;
  String password;
  String token;
  dynamic profilePhotoPath;
  final bool isActive;
  List<dynamic> sevkiyatBilgiGuncelleyenUsers;
  List<dynamic> sevkiyatBilgiOlusturanUsers;
  List<dynamic> sevkiyatBilgiSevkiyatcis;
  UserInfo({
    required this.isAdmin,
    required this.userId,
    required this.userName,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.token,
    required this.profilePhotoPath,
    required this.isActive,
    required this.sevkiyatBilgiGuncelleyenUsers,
    required this.sevkiyatBilgiOlusturanUsers,
    required this.sevkiyatBilgiSevkiyatcis,
  });

  Map<String, dynamic> toMap() {
    return {
      'isAdmin': isAdmin,
      'userId': userId,
      'userName': userName,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'token': token,
      'profilePhotoPath': profilePhotoPath,
      'isActive': isActive,
      'sevkiyatBilgiGuncelleyenUsers': sevkiyatBilgiGuncelleyenUsers,
      'sevkiyatBilgiOlusturanUsers': sevkiyatBilgiOlusturanUsers,
      'sevkiyatBilgiSevkiyatcis': sevkiyatBilgiSevkiyatcis,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      isAdmin: map['isAdmin'] ?? false,
      userId: map['userId']?.toInt() ?? 0,
      userName: map['userName'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      profilePhotoPath: map['profilePhotoPath'] ?? null,
      isActive: map['isActive'] ?? false,
      sevkiyatBilgiGuncelleyenUsers:
          List<dynamic>.from(map['sevkiyatBilgiGuncelleyenUsers']),
      sevkiyatBilgiOlusturanUsers:
          List<dynamic>.from(map['sevkiyatBilgiOlusturanUsers']),
      sevkiyatBilgiSevkiyatcis:
          List<dynamic>.from(map['sevkiyatBilgiSevkiyatcis']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source));
}
