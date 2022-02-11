// ignore: file_names
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pokedex/pages/login_page.dart';

showAlertDialog(BuildContext context, String message, String title) {
  Widget okButton = TextButton(
    child: Text("Tamam"),
    onPressed: () {
      if (title == "Şifre değiştirme başarılı") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      } else
        Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
