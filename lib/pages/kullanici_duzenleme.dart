import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/tum_kullanicilar.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';

class KullaniciDuzenlemeSayfasi extends StatefulWidget {
  int userId;

  String name;

  String surname;

  String username;

  String email;

  bool isActive;
  KullaniciDuzenlemeSayfasi({
    Key? key,
    required this.userId,
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    required this.isActive,
  }) : super(key: key);

  @override
  State<KullaniciDuzenlemeSayfasi> createState() =>
      _KullaniciDuzenlemeSayfasiState();
}

class _KullaniciDuzenlemeSayfasiState extends State<KullaniciDuzenlemeSayfasi> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerIsim = new TextEditingController();
  TextEditingController controllerSoyisim = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerKullaniciAdi = new TextEditingController();

  Api api = Api();

  @override
  void initState() {
    controllerIsim.text = widget.name;
    controllerSoyisim.text = widget.surname;
    controllerEmail.text = widget.email;
    controllerKullaniciAdi.text = widget.username;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool checkBoxValue = widget.isActive;
    return Scaffold(
      body: SingleChildScrollView(
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
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Kullanıcıyı Güncelle",
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
                                  controller: controllerIsim,
                                  onSaved: (newValue) {
                                    widget.name = newValue!;
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
                                  controller: controllerSoyisim,
                                  onSaved: (newValue) {
                                    widget.surname = newValue!;
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
                                  controller: controllerEmail,
                                  onSaved: (newValue) {
                                    widget.email = newValue!;
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
                                  controller: controllerKullaniciAdi,
                                  onSaved: (newValue) {
                                    widget.username = newValue!;
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Kullanıcı aktif mi?"),
                        CupertinoSwitch(
                          onChanged: (newValue) {
                            setState(() {
                              checkBoxValue = newValue;
                              widget.isActive = newValue;
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
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
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
                                  child: Text("Kullanıcıyı Güncelle"),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      EasyLoading.show(status: 'Yükleniyor...');
                                      var response = api
                                          .updateUser(
                                              widget.username,
                                              widget.name,
                                              widget.surname,
                                              widget.email,
                                              widget.isActive,
                                              widget.userId)
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
