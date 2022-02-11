import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/models/sevkiyat_bilgi.dart';
import 'package:pokedex/pages/sevkiyat_detaylar.dart';
import 'package:pokedex/widgets/drawerWidget.dart';

class SevkiyatSayfasi extends StatefulWidget {
  SevkiyatSayfasi({
    Key? key,
  }) : super(key: key);

  @override
  _SevkiyatSayfasiState createState() => _SevkiyatSayfasiState();
}

class _SevkiyatSayfasiState extends State<SevkiyatSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          "Sevkiyatlar",
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
      body: TumSevkiyatlar(),
    );
  }
}

class TumSevkiyatlar extends StatefulWidget {
  @override
  State<TumSevkiyatlar> createState() => _TumSevkiyatlarState();
}

class _TumSevkiyatlarState extends State<TumSevkiyatlar> {
  late Future<List<SevkiyatBilgi>> sevkiyatList;
  Api api = Api();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sevkiyatList = api.getAllSevkiyat();

    return Container(
      child: FutureBuilder<List<SevkiyatBilgi>>(
        future: sevkiyatList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var sevkiyatListt = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                var array;
                var sevkiyat = sevkiyatListt[index];
                if (sevkiyat.olusturulmaTarihi != null) {
                  array = sevkiyat.olusturulmaTarihi.split("T");

                  array = array[0];
                }
                return Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 10, bottom: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white10, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: isDarkG == true
                          ? generateColor(sevkiyat.proje).withAlpha(200)
                          : generateColor(sevkiyat.proje),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SevkiyatDetaySayfasi(
                                        id: sevkiyat.sevkiyatId,
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
                                    array != null
                                        ? array.toString()
                                        : "Tarih bilgisi yok.",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: isDarkG == true
                                          ? Colors.grey.shade300
                                          : CupertinoColors.black,
                                    ),
                                  ),
                                  sevkiyat.isActive == false
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: Icon(
                                            Icons.check,
                                            size: 65,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: Icon(
                                            Icons.cancel_sharp,
                                            size: 65,
                                            color: CupertinoColors.systemRed,
                                          ),
                                        )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    sevkiyat.proje,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(sevkiyat.plaka == null
                                  ? "Plaka eklenmedi"
                                  : sevkiyat.plaka),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(sevkiyat.sevkiyatNumara),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, bottom: 15),
                                  child: Container(
                                    child: sevkiyat.sevkiyatPhotoPath != null
                                        ? Container(
                                            height: 70,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    "${api.url}/photo/${sevkiyat.sevkiyatId}",
                                                    fit: BoxFit.cover,
                                                    width: 60.0,
                                                    height: 60.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Text("Fotoğraf yüklenmedi"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
              },
              itemCount: sevkiyatListt.length,
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

  Color generateColor(String proje) {
    switch (proje) {
      case "PJ20-Corsa":
        return Color.fromRGBO(226, 197, 71, 1);
      case "P2QO-Kolin":
        return Color.fromRGBO(205, 209, 204, 1);
      case "P2QO-Cergy":
        return Color.fromRGBO(153, 191, 179, 1);
      case "Nissan Micra":
        return Color.fromRGBO(172, 172, 172, 1);
      case "Novo Mesto":
        return Color.fromRGBO(194, 221, 200, 1);

      default:
    }

    return Colors.black12;
  }
}
