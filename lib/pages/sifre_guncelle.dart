import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/ayarlar.dart';
import 'package:pokedex/pages/login_page.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';

class SifreGuncellemeSayfasi extends StatefulWidget {
  const SifreGuncellemeSayfasi({Key? key}) : super(key: key);

  @override
  State<SifreGuncellemeSayfasi> createState() => _SifreGuncellemeSayfasiState();
}

class _SifreGuncellemeSayfasiState extends State<SifreGuncellemeSayfasi> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late String oldPw;
    Api api = Api();
    late String newPw;

    late String newPwAgain;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 12),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.keyboard_backspace)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            "Şifre Değiştir",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "images/a2.png",
                            width: 60,
                            height: 50,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 10),
                          child: TextFormField(
                            onSaved: (newValue) {
                              oldPw = newValue!;
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
                                      Icons.password,
                                      color: CupertinoColors.black,
                                    )),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.systemGrey),
                                labelText: 'Eski Şifre',
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
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 10),
                          child: TextFormField(
                            onSaved: (newValue) {
                              newPw = newValue!;
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
                                      Icons.add_moderator_sharp,
                                      color: CupertinoColors.black,
                                    )),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.systemGrey),
                                labelText: 'Yeni Şifre',
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
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen bir değer girin';
                              }

                              return null;
                            },
                            onSaved: (newValue) {
                              newPwAgain = newValue!;
                            },
                            autofocus: true,
                            decoration: const InputDecoration(
                                suffixIcon: CircleAvatar(
                                    backgroundColor: CupertinoColors
                                        .extraLightBackgroundGray,
                                    child: Icon(
                                      Icons.checklist_rtl_outlined,
                                      color: CupertinoColors.black,
                                    )),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.systemGrey),
                                labelText: 'Yeni Şifre Tekrar',
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
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
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
                            child: Text("Güncelle"),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                if (newPw != newPwAgain) {
                                  showAlertDialog(
                                      context,
                                      "Yeni şifreler uyuşmuyor",
                                      "Hatalı Şifre");
                                  return null;
                                }
                                if (oldPw == newPw) {
                                  showAlertDialog(
                                      context,
                                      "Eski şifre ve yeni şifre aynı olamaz",
                                      "Hatalı Şifre");
                                  return null;
                                }

                                EasyLoading.show(status: 'Yükleniyor...');
                                var response = await api
                                    .changePassword(oldPw, newPw)
                                    .then((value) {
                                  EasyLoading.dismiss();
                                  if (value == true) {
                                    showAlertDialog(
                                        context,
                                        "Şifre değiştirme başarılı! Giriş ekranına yönlendiriliyorsunuz",
                                        "Şifre değiştirme başarılı");
                                  } else {
                                    showAlertDialog(context,
                                        "Eski Şifre Hatalı", "Hatalı Şifre");
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
          ),
        ],
      ),
    );
  }
}
