import 'package:flutter/material.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/profil_guncelleme.dart';
import 'package:pokedex/pages/sifre_guncelle.dart';
import 'package:pokedex/widgets/drawerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokedex/main.dart';

import 'login_page.dart';

class AyarlarSayfasi extends StatefulWidget {
  AyarlarSayfasi({Key? key}) : super(key: key);

  @override
  _AyarlarSayfasiState createState() => _AyarlarSayfasiState();
}

class _AyarlarSayfasiState extends State<AyarlarSayfasi> {
  bool _switchValue = true;
  var _currentMode = ThemeMode.light;
  Color _color = CupertinoColors.activeBlue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            isDarkG == true ? CupertinoColors.black : CupertinoColors.white,
        iconTheme: IconThemeData(
            color: isDarkG == true
                ? CupertinoColors.white
                : CupertinoColors.black),
        //automaticallyImplyLeading: false,
        title: Text(
          "Ayarlar",
          style: TextStyle(
              color: isDarkG == true
                  ? CupertinoColors.white
                  : CupertinoColors.black),
        ),
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late Color _color;
  Api api = Api();

  bool _switchValue = true;
  var _currentMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    if (isDarkG == true) {
      _color = CupertinoColors.black;
    }
    if (isDarkG == false) {
      _color = CupertinoColors.white;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Column(
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
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${userInfoG!.name} ${userInfoG!.surname}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${userInfoG!.email} - ${userInfoG!.userName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: _color, borderRadius: BorderRadius.circular(40)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.dark_mode_sharp,
                        size: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      Text(
                        "Koyu Mod",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      CupertinoSwitch(
                        value: MyApp.themeNotifier.value == ThemeMode.light
                            ? _switchValue = false
                            : _switchValue = true,
                        onChanged: (value) {
                          setState(() {
                            MyApp.themeNotifier.value =
                                MyApp.themeNotifier.value == ThemeMode.light
                                    ? ThemeMode.dark
                                    : ThemeMode.light;
                            if (MyApp.themeNotifier.value == ThemeMode.light) {
                              _color = CupertinoColors.white;
                              isDarkG = false;
                            }
                            if (MyApp.themeNotifier.value == ThemeMode.dark) {
                              _color = CupertinoColors.black;
                              isDarkG = true;
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: _color, borderRadius: BorderRadius.circular(40)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Profil",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProfilGuncellemeSayfasi()));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Column(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            Text(
                              "Profil Bilgilerini Güncelle",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [Icon(Icons.arrow_forward_ios)],
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: _color, borderRadius: BorderRadius.circular(40)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SifreGuncellemeSayfasi()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Column(
                            children: [
                              Icon(
                                Icons.edit_road,
                                color: Colors.white,
                                size: 35,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              "Şifre Değiştir",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Column(
                          children: [Icon(Icons.arrow_forward_ios)],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: _color, borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Column(
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                size: 35,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 75,
                        ),
                        Column(
                          children: [
                            Text(
                              "Çıkış Yap",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios))
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: _color, borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(right: 25),
                child: Text(
                  "App Version 1.1.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
