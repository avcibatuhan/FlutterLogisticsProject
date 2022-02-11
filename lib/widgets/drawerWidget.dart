import 'package:flutter/material.dart';
import 'package:pokedex/pages/login_page.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/ayarlar.dart';
import 'package:pokedex/pages/kullanici_ekleme.dart';

import 'package:pokedex/pages/sevkiyat_ekleme.dart';
import 'package:pokedex/pages/sevkiyat_sayfasi.dart';
import 'package:pokedex/pages/tum_kullanicilar.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Column(
            children: [
              Text(
                "Hoşgeldiniz ${userInfoG?.name} ${userInfoG!.surname}",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        ListTile(
          title: const Text('Tüm Sevkiyatlar'),
          leading: Icon(Icons.airport_shuttle_outlined),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SevkiyatSayfasi()));
          },
        ),
        if (userInfoG!.isAdmin)
          ListTile(
            title: const Text('Sevkiyat Ekle'),
            leading: Icon(Icons.add_box),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SevkiyatEklemeSayfasi()));
            },
          ),
        if (userInfoG!.isAdmin)
          ListTile(
            title: const Text('Tüm Kullanıcılar'),
            leading: Icon(Icons.people),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TumKullanicilarSayfasi()));
            },
          ),
        if (userInfoG!.isAdmin)
          ListTile(
            title: const Text('Kullanıcı Ekle'),
            leading: Icon(Icons.add_box),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          KullaniciEklemeSayfasi()));
            },
          ),
        ListTile(
          title: const Text('Ayarlar'),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AyarlarSayfasi()));
          },
        ),
        ListTile(
          title: const Text('Çıkış Yap'),
          leading: Icon(Icons.logout_outlined),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
          },
        ),
      ],
    );
  }
}
