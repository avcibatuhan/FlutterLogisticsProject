import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/sevkiyat_sayfasi.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';

class SevkiyatDuzenlemeSayfasi extends StatefulWidget {
  int sevkiyatId;
  String proje;
  dynamic plaka;
  String sevkiyatNumarasi;
  bool isActive;
  dynamic tarih;
  SevkiyatDuzenlemeSayfasi({
    Key? key,
    required this.sevkiyatId,
    required this.proje,
    this.plaka,
    required this.sevkiyatNumarasi,
    required this.isActive,
    required this.tarih,
  }) : super(key: key);

  @override
  _SevkiyatDuzenlemeSayfasiState createState() =>
      _SevkiyatDuzenlemeSayfasiState();
}

class _SevkiyatDuzenlemeSayfasiState extends State<SevkiyatDuzenlemeSayfasi> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("PJ20-Corsa"), value: "PJ20-Corsa"),
      DropdownMenuItem(child: Text("P2QO-Kolin"), value: "P2QO-Kolin"),
      DropdownMenuItem(child: Text("P2QO-Cergy"), value: "P2QO-Cergy"),
      DropdownMenuItem(child: Text("Nissan Micra"), value: "Nissan Micra"),
      DropdownMenuItem(child: Text("Novo Mesto"), value: "Novo Mesto"),
    ];
    return menuItems;
  }

  TextEditingController controllerPlaka = new TextEditingController();
  TextEditingController controllerTarih = new TextEditingController();

  TextEditingController controllerSevkiyatNumarasi =
      new TextEditingController();
  @override
  void initState() {
    controllerPlaka.text = widget.plaka != null ? widget.plaka : "";
    controllerSevkiyatNumarasi.text = widget.sevkiyatNumarasi;
    controllerTarih.text = widget.tarih.toString().substring(0, 10);

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  var dateController = TextEditingController();
  var dateState;

  Api api = Api();

  @override
  Widget build(BuildContext context) {
    var array = widget.tarih.split("T");
    array = array[0];
    dateState = array.toString();
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
                                "Sevkiyat Güncelle",
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
                                  controller: controllerPlaka,
                                  onSaved: (newValue) {
                                    widget.plaka = newValue!;
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
                                            Icons.airport_shuttle_rounded,
                                            color: CupertinoColors.black,
                                          )),
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.systemGrey),
                                      labelText: 'Plaka',
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
                                  controller: controllerSevkiyatNumarasi,
                                  onSaved: (newValue) {
                                    widget.sevkiyatNumarasi = newValue!;
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
                                      labelText: 'Sevkiyat Numarası',
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
                                  child: DropdownButton(
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          widget.proje = newValue!;
                                        });
                                      },
                                      value: widget.proje,
                                      items: dropdownItems)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor:
                                      CupertinoColors.extraLightBackgroundGray,
                                  child: Icon(
                                    Icons.format_list_numbered,
                                    color: CupertinoColors.black,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          readOnly: true,
                          controller: controllerTarih,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Tarih',
                              suffixIcon: CircleAvatar(
                                backgroundColor:
                                    CupertinoColors.extraLightBackgroundGray,
                                child: Icon(Icons.date_range,
                                    color: CupertinoColors.black),
                              )),
                          onTap: () async {
                            dateState = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2100));

                            controllerTarih.text = dateState != null
                                ? dateState.toString().substring(0, 10)
                                : "";
                          },
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
                                  child: Text("Sevkiyat Güncelle"),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      EasyLoading.show(status: 'Yükleniyor...');
                                      var response = api
                                          .updateSevkiyat(
                                              widget.plaka,
                                              widget.proje,
                                              widget.sevkiyatNumarasi,
                                              dateState,
                                              userInfoG!.userId,
                                              widget.sevkiyatId)
                                          .then((value) => {
                                                EasyLoading.dismiss(),
                                                if (value == true)
                                                  {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                SevkiyatSayfasi()))
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
