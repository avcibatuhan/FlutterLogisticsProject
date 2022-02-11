import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/ayarlar.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';

class ProfilGuncellemeSayfasi extends StatefulWidget {
  ProfilGuncellemeSayfasi({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilGunncelemeSayfasiState createState() =>
      _ProfilGunncelemeSayfasiState();
}

class _ProfilGunncelemeSayfasiState extends State<ProfilGuncellemeSayfasi> {
  late String userName;
  late String name;
  late String surname;
  late String email;
  final _formKey = GlobalKey<FormState>();
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          children: [
                            IconButton(
                              icon: new Icon(Icons.keyboard_backspace),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AyarlarSayfasi()));
                              },
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Profil Güncelle",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          children: [
                            userInfoG!.profilePhotoPath != null
                                ? Container(
                                    height: 70,
                                    child: ClipOval(
                                      child: Image.network(
                                        "${api.url}/photo/${userInfoG!.userId}",
                                        fit: BoxFit.cover,
                                        width: 60.0,
                                        height: 60.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: ClipOval(
                                    child: Image.asset(
                                      "images/a2.png",
                                      width: 60,
                                      height: 50,
                                    ),
                                  )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              controller: TextEditingController(
                                  text: userInfoG!.userName),
                              onSaved: (newValue) {
                                userName = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen bir değer girin';
                                }
                                return null;
                              },
                              autofocus: true,
                              decoration: const InputDecoration(
                                  suffixIcon: CircleAvatar(
                                      backgroundColor: CupertinoColors
                                          .extraLightBackgroundGray,
                                      child: Icon(
                                        Icons.format_list_numbered,
                                        color: CupertinoColors.black,
                                      )),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.systemGrey),
                                  labelText: 'Kullanıcı Adı',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CupertinoColors.black))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              controller:
                                  TextEditingController(text: userInfoG!.name),
                              onSaved: (newValue) {
                                name = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen bir değer girin';
                                }
                                return null;
                              },
                              autofocus: true,
                              decoration: const InputDecoration(
                                  suffixIcon: CircleAvatar(
                                      backgroundColor: CupertinoColors
                                          .extraLightBackgroundGray,
                                      child: Icon(
                                        Icons.pending_actions_rounded,
                                        color: CupertinoColors.black,
                                      )),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.systemGrey),
                                  labelText: 'İsim',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CupertinoColors.black))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              controller: TextEditingController(
                                  text: userInfoG!.surname),
                              onSaved: (newValue) {
                                surname = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen bir değer girin';
                                }
                                return null;
                              },
                              autofocus: true,
                              decoration: const InputDecoration(
                                  suffixIcon: CircleAvatar(
                                      backgroundColor: CupertinoColors
                                          .extraLightBackgroundGray,
                                      child: Icon(
                                        Icons.airport_shuttle_outlined,
                                        color: CupertinoColors.black,
                                      )),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.systemGrey),
                                  labelText: 'Soyisim',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CupertinoColors.black))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              controller:
                                  TextEditingController(text: userInfoG!.email),
                              onSaved: (newValue) {
                                email = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen bir değer girin';
                                }
                                return null;
                              },
                              autofocus: true,
                              decoration: const InputDecoration(
                                  suffixIcon: CircleAvatar(
                                      backgroundColor: CupertinoColors
                                          .extraLightBackgroundGray,
                                      child: Icon(
                                        Icons.airport_shuttle_outlined,
                                        color: CupertinoColors.black,
                                      )),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.systemGrey),
                                  labelText: 'E-mail',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CupertinoColors.black))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      CupertinoColors.black),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: CupertinoColors.black)))),
                              child: Text("Profil Güncelle"),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  EasyLoading.show(status: 'Yükleniyor...');
                                  var response = api
                                      .updateProfile(userName, name, surname,
                                          email, userInfoG!.userId)
                                      .then((value) => {
                                            EasyLoading.dismiss(),
                                            if (value == true)
                                              {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            AyarlarSayfasi()))
                                              }
                                            else
                                              {
                                                showAlertDialog(
                                                    context,
                                                    "Bağlantı hatası",
                                                    "Hatalı giriş")
                                              }
                                          });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
