import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/pages/sevkiyat_sayfasi.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  Api api = Api();
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? sifre;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text(
                        "Diniz",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 55,
                            fontFamily: 'Montserrat'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Adient",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 55,
                                fontFamily: 'Montserrat'))
                      ],
                    ),
                    Column(
                      children: [
                        Text(".",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Color.fromRGBO(0, 217, 89, 1)))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 85,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 50.0, right: 50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'L??tfen bir de??er girin';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                username = newValue;
                              },
                              autofocus: true,
                              decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black),
                                  hintText: 'Kullan??c?? Ad??n??z?? Giriniz',
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(0, 217, 89, 1),
                                      fontWeight: FontWeight.bold),
                                  labelText: 'KULLANICI ADI',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 50.0, right: 50),
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'L??tfen bir de??er girin';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                sifre = newValue;
                              },
                              autofocus: true,
                              decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black),
                                  hintText: '??ifrenizi Giriniz',
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(0, 217, 89, 1),
                                      fontWeight: FontWeight.bold),
                                  labelText: '????FRE',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0, left: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton.extended(
                                shape: BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    EasyLoading.show(status: 'Y??kleniyor...');
                                    var response = api
                                        .login(username, sifre)
                                        .then((value) => {
                                              EasyLoading.dismiss(),
                                              if (value != null)
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
                                                      "Kullan??c?? ad?? veya ??ifre hatal??",
                                                      "Hatal?? giri??")
                                                }
                                            });
                                  }
                                },
                                label: const Text(
                                  "G??R???? YAP",
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                ),
                                backgroundColor: Color.fromRGBO(0, 217, 89, 1),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
