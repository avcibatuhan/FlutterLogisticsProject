import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/pages/sevkiyat_sayfasi.dart';
import 'package:pokedex/widgets/drawerWidget.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';

class SevkiyatEklemeSayfasi extends StatelessWidget {
  const SevkiyatEklemeSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SevkiyatEkleForm(),
    );
  }
}

class SevkiyatEkleForm extends StatefulWidget {
  const SevkiyatEkleForm({Key? key}) : super(key: key);

  @override
  State<SevkiyatEkleForm> createState() => _SevkiyatEkleFormState();
}

class _SevkiyatEkleFormState extends State<SevkiyatEkleForm> {
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

  String proje = "PJ20-Corsa";
  final _formKey = GlobalKey<FormState>();
  Api api = Api();
  late String sevkiyatNumarasi;
  var dateState;
  final dateController = TextEditingController();
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
                                              SevkiyatSayfasi()));
                                },
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "Sevkiyat Ekle",
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
                                  sevkiyatNumarasi = newValue!;
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: DropdownButton(
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        proje = newValue!;
                                      });
                                    },
                                    value: proje,
                                    items: dropdownItems)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircleAvatar(
                                maxRadius: 25.0,
                                backgroundColor:
                                    CupertinoColors.extraLightBackgroundGray,
                                child: Icon(
                                  Icons.pending_actions_rounded,
                                  color: CupertinoColors.black,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        readOnly: true,
                        controller: dateController,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CupertinoColors.black)),
                          labelText: 'Tarih*',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.systemGrey),
                          suffixIcon: CircleAvatar(
                              backgroundColor:
                                  CupertinoColors.extraLightBackgroundGray,
                              child: Icon(
                                Icons.date_range,
                                color: CupertinoColors.black,
                              )),
                        ),
                        onTap: () async {
                          dateState = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime(2100));

                          dateController.text = dateState != null
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
                                                color:
                                                    CupertinoColors.black)))),
                                child: Text("Sevkiyat Ekle"),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    EasyLoading.show(status: 'Yükleniyor...');
                                    var response = api
                                        .addSevkiyat(proje, sevkiyatNumarasi,
                                            dateState, userInfoG!.userId)
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
    );
  }
}
