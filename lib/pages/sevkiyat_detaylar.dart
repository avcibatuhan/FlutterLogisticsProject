import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pokedex/api.dart';
import 'package:pokedex/globals.dart';
import 'package:pokedex/models/sevkiyat_bilgi.dart';
import 'package:pokedex/pages/sevkiyat_duzenle.dart';
import 'package:pokedex/pages/sevkiyat_sayfasi.dart';
import 'package:pokedex/widgets/showAlertDialog.dart';

class SevkiyatDetaySayfasi extends StatefulWidget {
  int id;

  SevkiyatDetaySayfasi({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SevkiyatDetaySayfasi> createState() => _SevkiyatDetaySayfasiState();
}

class _SevkiyatDetaySayfasiState extends State<SevkiyatDetaySayfasi> {
  Api api = Api();
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  File? myFile;
  @override
  Widget build(BuildContext context) {
    var sevkiyatBilgi = api.getSevkiyatById(widget.id);

    return Container(
      child: FutureBuilder<SevkiyatBilgi>(
        future: sevkiyatBilgi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var sevkiyatBilgii = snapshot.data!;
            var array;
            var sevkiyat = sevkiyatBilgii.olusturulmaTarihi;
            if (sevkiyat != null) {
              array = sevkiyat.split("T");
              array = array[0];
            }
            return Scaffold(
              body: Container(
                child: Stack(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (sevkiyatBilgii.sevkiyatPhotoPath != null) ...[
                              Expanded(
                                child: Image.network(
                                  "${api.url}/photo/${sevkiyatBilgii.sevkiyatId}",
                                ),
                              )
                            ] else if (userInfoG!.isAdmin == false) ...[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: _image != null
                                      ? Column(
                                          children: [
                                            Material(
                                              child: Image.file(myFile!,
                                                  fit: BoxFit.fill),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_a_photo,
                                              color: Colors.grey[800],
                                              size: 90,
                                            ),
                                            Text("Fotoğraf Ekle")
                                          ],
                                        ),
                                ),
                              ),
                            ] else if (userInfoG!.isAdmin == true &&
                                sevkiyatBilgii.sevkiyatPhotoPath == null) ...[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Image.asset("images/truckk2.png")],
                                ),
                              ),
                            ]
                          ],
                        ),
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Sevkiyat Detaylar",
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
                                              width: 50.0,
                                              height: 40.0,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: ClipOval(
                                          child: Image.asset(
                                            "images/a2.png",
                                            width: 50,
                                            height: 40,
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
                          : CupertinoColors.white.withOpacity(0.6),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          children: [
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
                                          "${sevkiyatBilgii.proje}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      sevkiyatBilgii.isActive != true
                                          ? Icons.check
                                          : Icons.cancel_sharp,
                                      color: sevkiyatBilgii.isActive != true
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
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40.0),
                                        child: Text(
                                          sevkiyatBilgii.plaka != null
                                              ? "${sevkiyatBilgii.plaka}"
                                              : "Plaka eklenmedi",
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
                                          "${sevkiyatBilgii.sevkiyatNumara}",
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${array.toString()}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            if (userInfoG!.isAdmin)
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                            CupertinoColors
                                                                .black),
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
                                                              SevkiyatDuzenlemeSayfasi(
                                                                sevkiyatId:
                                                                    sevkiyatBilgii
                                                                        .sevkiyatId,
                                                                isActive:
                                                                    sevkiyatBilgii
                                                                        .isActive,
                                                                sevkiyatNumarasi:
                                                                    sevkiyatBilgii
                                                                        .sevkiyatNumara,
                                                                proje:
                                                                    sevkiyatBilgii
                                                                        .proje,
                                                                plaka:
                                                                    sevkiyatBilgii
                                                                        .plaka,
                                                                tarih: sevkiyatBilgii
                                                                    .olusturulmaTarihi,
                                                              )));
                                                },
                                                child: const Text('Düzenle'),
                                              ),
                                            if (userInfoG!.isAdmin == false &&
                                                sevkiyatBilgii.sevkiyatPhotoPath ==
                                                    null &&
                                                _image != null)
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all(
                                                              CupertinoColors
                                                                  .black),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      18.0),
                                                              side: BorderSide(
                                                                  color: CupertinoColors
                                                                      .black)))),
                                                  onPressed: () {
                                                    EasyLoading.show(
                                                        status:
                                                            'Yükleniyor...');
                                                    uploadImage(
                                                            myFile!.path,
                                                            sevkiyatBilgii
                                                                .sevkiyatId,
                                                            userInfoG!.userId)
                                                        .then((value) {
                                                      EasyLoading.dismiss();
                                                      if (value == true) {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    SevkiyatSayfasi()));
                                                      } else {
                                                        showAlertDialog(
                                                            context,
                                                            "Gönderim esnasında bir hata oluştu",
                                                            "Hatalı giriş");
                                                      }
                                                    });
                                                  },
                                                  child: Text("Fotoğrafı Gönder"))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
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

  Future<bool> uploadImage(String path, id, userId) async {
    Dio dio = new Dio();
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile('$path'),
      'GuncelleyenUserId': userId,
    });
    var response = await dio.post(
        'http://YOUR_DOMAIN_HERE/api/Sevkiyat_Kullanicilar/uploadImage/$id',
        data: formData);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  _imgFromCamera() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (image != null) {
        _image = image;
        myFile = File(_image!.path);
      }
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (image != null) {
        _image = image;
        myFile = File(_image!.path);
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
