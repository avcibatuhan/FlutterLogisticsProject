import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/models/sevkiyat_kullanicilar.dart';
import 'package:pokedex/pages/kullanici_detay.dart';
import 'package:pokedex/widgets/drawerWidget.dart';

class TumKullanicilarSayfasi extends StatefulWidget {
  const TumKullanicilarSayfasi({Key? key}) : super(key: key);

  @override
  State<TumKullanicilarSayfasi> createState() => _TumKullanicilarSayfasiState();
}

class _TumKullanicilarSayfasiState extends State<TumKullanicilarSayfasi> {
  late Future<List<SevkiyatKullanicilar>> sevkiyatKullanicilar;
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    sevkiyatKullanicilar = api.getAllUsers();
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          "Kullanıcılar",
          style: TextStyle(
              color: isDarkG == true
                  ? CupertinoColors.white
                  : CupertinoColors.black),
        ),
        backgroundColor:
            isDarkG == true ? CupertinoColors.black : CupertinoColors.white,
        iconTheme: IconThemeData(
            color: isDarkG == true
                ? CupertinoColors.white
                : CupertinoColors.black),
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: Container(
        child: FutureBuilder<List<SevkiyatKullanicilar>>(
          future: sevkiyatKullanicilar,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var sevkiyatKullanicilarr = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  var kullanici = sevkiyatKullanicilarr[index];
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white10, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: isDarkG == true
                            ? generateRandomColor2(index % 3).withAlpha(60)
                            : generateRandomColor2(index % 3).withAlpha(180),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        KullaniciDetaySayfasi(
                                          id: kullanici.userId,
                                        )));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      kullanici.name + " " + kullanici.surname,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    kullanici.profilePhotoPath != null
                                        ? Container(
                                            height: 70,
                                            child: ClipOval(
                                              child: Image.network(
                                                "${api.url}/photo/${kullanici.userId}",
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
                                              height: 60,
                                            ),
                                          )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "E-mail:",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      kullanici.email,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Kullanıcı Adı:",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      kullanici.userName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
                itemCount: sevkiyatKullanicilarr.length,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Color generateRandomColor2(int colorId) {
    const predefinedColors = [
      Color.fromRGBO(19, 211, 249, 1),
      Color.fromRGBO(246, 223, 94, 1),
      Color.fromRGBO(16, 214, 158, 1),
    ];

    return predefinedColors[colorId];
  }
}
