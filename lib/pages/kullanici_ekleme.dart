import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/tum_kullanicilar.dart';
import 'package:pokedex/widgets/drawerWidget.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';

class KullaniciEklemeSayfasi extends StatefulWidget {
  const KullaniciEklemeSayfasi({Key? key}) : super(key: key);

  @override
  State<KullaniciEklemeSayfasi> createState() => _KullaniciEklemeSayfasiState();
}

class _KullaniciEklemeSayfasiState extends State<KullaniciEklemeSayfasi> {
  final _formKey = GlobalKey<FormState>();
  Api api = Api();
  bool checkBoxValue = false;

  dynamic userId;
  late String userName;
  late String name;
  late String surname;
  late String email;
  late String password;
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70.0, bottom: 20),
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
                                                TumKullanicilarSayfasi()));
                                  },
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Kullanıcı Ekle",
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
                    color: isDarkG == true
                        ? CupertinoColors.black
                        : CupertinoColors.white,
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
                                            Icons.format_list_numbered,
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
                                            Icons.format_list_numbered,
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
                                            Icons.person_outline_sharp,
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
                                            Icons.email_outlined,
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
                                padding: const EdgeInsets.all(20),
                                child: TextFormField(
                                  onSaved: (newValue) {
                                    password = newValue!;
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
                                            Icons.vpn_key_outlined,
                                            color: CupertinoColors.black,
                                          )),
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.systemGrey),
                                      labelText: 'Parola',
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Eklenilen kişi admin mi olacak?"),
                        CupertinoSwitch(
                          onChanged: (newValue) {
                            setState(() {
                              checkBoxValue = newValue;
                              isAdmin = newValue;
                            });
                          },
                          value: checkBoxValue,
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
                                padding: const EdgeInsets.all(16.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              CupertinoColors.black),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color:
                                                      CupertinoColors.black)))),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      EasyLoading.show(status: 'Yükleniyor...');
                                      var response = api
                                          .addKullanici(name, surname, email,
                                              userName, isAdmin, password)
                                          .then((value) => {
                                                EasyLoading.dismiss(),
                                                if (value == true)
                                                  {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                TumKullanicilarSayfasi()))
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
                                  child: const Text('Kullanıcı Ekle'),
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
        ),
      ),
    );
  }
}
