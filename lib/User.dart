import 'package:finalproject_pmoif20d_wahyu/DetailCeritaGratis.dart';
import 'package:finalproject_pmoif20d_wahyu/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'TambahCerita.dart';

List<String> bank = ["Pilih Bank Tujuan", "BRI", "BNI", "BCA", "Mandiri"];
String bankDipilih = "Pilih Bank Tujuan";

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
          centerTitle: true,
          title: const Text(
            'User',
            style: TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: Color(0xFF6A2B84),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout_rounded))
          ],
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
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TambahCerita()));
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
                              onPressed: () {
                                showDialogKomisi(context);
                              },
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
                              onPressed: () {
                                showDialogUbah(context);
                              },
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
                        padding: EdgeInsets.only(left: 10),
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

void showDialogUbah(context) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: Text(
                          "Edit Profil",
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'PoppinsMedium'),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  )),
              Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Wrap(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Nama Lengkap',
                          isDense: true,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: const TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Email',
                          isDense: true,
                          contentPadding: EdgeInsets.all(10),
                        ))),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: const TextField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              labelText: 'Password',
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ))),
                    Divider(indent: 20, endIndent: 20),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: const Text(
                        '*Abaikan jika tidak mengganti password',
                        style: TextStyle(
                            fontFamily: 'PoppinsItalic',
                            fontSize: 8,
                            color: Color(0xFF6A2B84)),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: const TextField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              labelText: 'Password Baru',
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ))),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: const TextField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              labelText: 'Ulangi Password Baru',
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ))),
                    Container(
                        margin: EdgeInsets.all(25),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFF6A2B84),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Simpan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'PoppinsMedium',
                                        color: Color(0xffffffff),
                                      ))),
                            )
                          ],
                        ))
                  ]))
            ]);
      });
}

void showDialogKomisi(context) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: Text(
                          "Tarik Komisi",
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'PoppinsMedium'),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  )),
              Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Wrap(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: 'Jumlah Penarikan',
                          isDense: true,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                      child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          isExpanded: true,
                          hint: const Text("Silakan pilih agama anda"),
                          icon: Icon(Icons.keyboard_arrow_down),
                          value: bankDipilih,
                          items: bank.map((String value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (String? value) {
                            {
                              bankDipilih = value!;
                            }
                            ;
                          }),
                    )
                  ])),
              Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: const TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Nama Pemilik Rekening',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ))),
              Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: const TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Nomor Rekening',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ))),
              Container(
                  margin: EdgeInsets.all(25),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF6A2B84),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Proses",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'PoppinsMedium',
                                  color: Color(0xffffffff),
                                ))),
                      )
                    ],
                  ))
            ]);
      });
}
