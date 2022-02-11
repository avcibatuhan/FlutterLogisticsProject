import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/models/sevkiyat_kullanicilar.dart';
import 'package:pokedex/pages/kullanici_duzenleme.dart';
import 'package:pokedex/pages/tum_kullanicilar.dart';

class KullaniciDetaySayfasi extends StatelessWidget {
  int id;
  KullaniciDetaySayfasi({
    Key? key,
    required this.id,
  }) : super(key: key);
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    var kullaniciBilgi = api.getKullaniciById(id);
    return Container(
      child: FutureBuilder<SevkiyatKullanicilar>(
        future: kullaniciBilgi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kullaniciBilgii = snapshot.data!;
            return Scaffold(
              body: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
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
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Kullanıcı Detayları",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
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
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kullaniciBilgii.profilePhotoPath != null
                                ? Expanded(
                                    child: Image.network(
                                      "${api.url}/photo/${kullaniciBilgii.userId}",
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Expanded(
                                    child: Image.asset(
                                      "images/a2.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Text(
                                            "${kullaniciBilgii.name + " " + kullaniciBilgii.surname}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 37),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        kullaniciBilgii.isActive == true
                                            ? Icons.check
                                            : Icons.cancel_sharp,
                                        color: kullaniciBilgii.isActive == true
                                            ? CupertinoColors.activeGreen
                                            : CupertinoColors.systemRed,
                                        size: 65,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Text(
                                            "${kullaniciBilgii.email}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Text(
                                            "${kullaniciBilgii.userName}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      if (userInfoG!.isAdmin)
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      CupertinoColors.black),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color: CupertinoColors
                                                              .black)))),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        KullaniciDuzenlemeSayfasi(
                                                          email: kullaniciBilgii
                                                              .email,
                                                          isActive:
                                                              kullaniciBilgii
                                                                  .isActive,
                                                          name: kullaniciBilgii
                                                              .name,
                                                          surname:
                                                              kullaniciBilgii
                                                                  .surname,
                                                          userId:
                                                              kullaniciBilgii
                                                                  .userId,
                                                          username:
                                                              kullaniciBilgii
                                                                  .userName,
                                                        )));
                                          },
                                          child: const Text('Düzenle'),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
