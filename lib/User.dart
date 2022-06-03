import 'package:finalproject_pmoif20d_wahyu/DetailCeritaGratis.dart';
import 'package:finalproject_pmoif20d_wahyu/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'TambahCerita.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          backgroundColor: Color(0xFF6A2B84),
        ),
        body: ListView(children: [
          Container(
              height: 250,
              color: Color(0xFF6A2B84),
              padding: EdgeInsets.all(3),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Container(
                            child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                                radius: 50),
                          ),
                          Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Nama Pengguna",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'PoppinsMedium'),
                              ),
                              Text(
                                "contohemail@gmail.com",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'PoppinsMedium'),
                              ),
                              Text(
                                "Rp 100.000,-",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'PoppinsMedium',
                                    height: 3),
                              ),
                            ],
                          ))
                        ])),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => TambahCerita()));
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(130, 30),
                                  maximumSize: const Size(130, 30),
                                  primary: Colors.white,
                                  onPrimary: Color(0xFF6A2B84),
                                  onSurface: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  textStyle: const TextStyle(
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: 11)),
                              icon: const Icon(
                                Icons.list_alt_rounded,
                                size: 15,
                              ),
                              label: Text('Tambah Cerita')),
                          ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(115, 30),
                                  maximumSize: const Size(115, 30),
                                  primary: Colors.white,
                                  onPrimary: Color(0xFF6A2B84),
                                  onSurface: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  textStyle: const TextStyle(
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: 11)),
                              icon: const Icon(
                                Icons.credit_card_outlined,
                                size: 15,
                              ),
                              label: Text('Tarik Komisi')),
                          ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 30),
                                  maximumSize: const Size(100, 30),
                                  primary: Colors.white,
                                  onPrimary: Color(0xFF6A2B84),
                                  onSurface: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  textStyle: const TextStyle(
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: 11)),
                              icon: const Icon(
                                Icons.edit_outlined,
                                size: 15,
                              ),
                              label: Text('Edit Profil')),
                        ],
                      ),
                    )
                  ])),
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kontribusi Cerita Anda',
                      style:
                          TextStyle(fontFamily: 'PoppinsBlack', fontSize: 13),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF9B5DB5),
                            borderRadius: BorderRadius.circular(8)),
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left:10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Cerita 1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: 13),
                              ),
                              Container(
                                  child: Row(children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  tooltip: 'Edit Cerita',
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    tooltip: 'Hapus Cerita'),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailCeritaGratis()));
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  tooltip: 'Lihat Detail Cerita',
                                )
                              ]))
                            ]))
                  ]))
        ]));
  }
}
