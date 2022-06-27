import 'dart:convert';
import 'dart:io';
import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:finalproject_pmoif20d_wahyu/DetailCeritaGratis.dart';
import 'package:finalproject_pmoif20d_wahyu/HomePage.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'EditCerita.dart';
import 'TambahCerita.dart';
import 'HomePage.dart';

List<String> bank = ["Pilih Bank Tujuan", "BRI", "BNI", "BCA", "Mandiri"];
String bankDipilih = "Pilih Bank Tujuan";

class User extends StatefulWidget {
  User({Key? key}) : super(key: key);

  String uEmail = "";
  User.withId(this.uEmail, {Key? key}) : super(key: key) {
    debugPrint(uEmail);
  }

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  List widgetUsers = [];

  @override
  void initState() {
    super.initState();
    loadDataUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          centerTitle: true,
          title: const Text(
            'User',
            style: TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: const Color(0xFF6A2B84),
          actions: [
            IconButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.WARNING,
                    headerAnimationLoop: false,
                    animType: AnimType.SCALE,
                    title: 'Logout',
                    desc: 'Apakah Anda yakin akan keluar dari aplikasi?',
                    buttonsTextStyle: const TextStyle(color: Colors.white),
                    btnCancelText: "Tidak",
                    btnOkText: "Ya",
                    btnOkColor: const Color(0xFF6A2B84),
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      logOut();
                    },
                  ).show();
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: ListView(children: [
          Container(
              height: 250,
              color: const Color(0xFF6A2B84),
              padding: const EdgeInsets.all(3),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                          Container(
                              child: Stack(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: _imageFile == null
                                      ? const AssetImage(
                                              'assets/images/profile.png')
                                          as ImageProvider
                                      : FileImage(File(_imageFile!.path)),
                                  radius: 50),
                              Positioned(
                                  bottom: 5.0,
                                  right: 0.0,
                                  child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) =>
                                              bottomSheet(context)),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Color(0xFFc4aacf),
                                        size: 25.0,
                                      )))
                            ],
                          )),
                          Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                u_namalengkap,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'PoppinsMedium'),
                              ),
                              Text(
                                // widget.uEmail,
                                '$u_email',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'PoppinsMedium'),
                              ),
                              const Text(
                                "Rp 100.000,-",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'PoppinsMedium',
                                    height: 3),
                              )
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
                                        builder: (context) =>
                                            const TambahCerita()));
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(130, 30),
                                  maximumSize: const Size(130, 30),
                                  primary: Colors.white,
                                  onPrimary: const Color(0xFF6A2B84),
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
                              label: const Text('Tambah Cerita')),
                          ElevatedButton.icon(
                              onPressed: () {
                                showDialogKomisi(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(115, 30),
                                  maximumSize: const Size(115, 30),
                                  primary: Colors.white,
                                  onPrimary: const Color(0xFF6A2B84),
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
                              label: const Text('Tarik Komisi')),
                          ElevatedButton.icon(
                              onPressed: () {
                                showDialogUbah(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 30),
                                  maximumSize: const Size(100, 30),
                                  primary: Colors.white,
                                  onPrimary: const Color(0xFF6A2B84),
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
                              label: const Text('Edit Profil')),
                        ],
                      ),
                    )
                  ])),
          Container(
              padding: const EdgeInsets.all(20),
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
                            color: const Color(0xFF9B5DB5),
                            borderRadius: BorderRadius.circular(8)),
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.only(left: 10),
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EditCerita()));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  tooltip: 'Edit Cerita',
                                ),
                                IconButton(
                                    onPressed: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.QUESTION,
                                        headerAnimationLoop: false,
                                        animType: AnimType.SCALE,
                                        title: 'Hapus',
                                        desc:
                                            'Apa anda yakin akan menghapus cerita ini?',
                                        buttonsTextStyle: const TextStyle(
                                            color: Colors.white),
                                        btnCancelText: "Tidak",
                                        btnOkText: "Ya",
                                        btnOkColor: const Color(0xFF6A2B84),
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () {},
                                      ).show();
                                    },
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
                                                const DetailCeritaGratis()));
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

  Widget bottomSheet(context) {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(children: <Widget>[
          const Text("Pilih Foto Profil",
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "PoppinsMedium",
                  color: Color(0xFF6A2B84))),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
                icon: const Icon(Icons.camera, color: Color(0xFF6A2B84)),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: const Text(
                  "Camera",
                  style: TextStyle(
                      fontFamily: "PoppinsMedium", color: Color(0xFF6A2B84)),
                )),
            FlatButton.icon(
                icon: const Icon(Icons.image, color: Color(0xFF6A2B84)),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                label: const Text("Gallery",
                    style: TextStyle(
                        fontFamily: "PoppinsMedium",
                        color: Color(0xFF6A2B84)))),
          ])
        ]));
  }

  void takePhoto(ImageSource source) async {
    final image = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = File(image!.path);
    });
  }

  void backToHome() {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }

  logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("token");
      pref.remove("is_login");
      pref.remove("email");

      u_id = "";
      u_kodeuser = "";
      u_username = "";
      u_namalengkap = "";
      u_email = "";
      u_password = "";
    });

    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      headerAnimationLoop: true,
      title: 'Logout Berhasil',
      desc: 'Terimakasih telah menggunakan aplikasi kami.',
      btnOkOnPress: () {
        Navigator.pop(context);
        backToHome();
      },
      btnOkIcon: Icons.cancel,
    ).show();
  }

  Future<void> loadDataUsers() async {
    if('$u_email' != ""){
      var dataURL = Uri.parse(baseURL + 'users/$u_email');
      http.Response response = await http.get(dataURL);

      setState(() {
        widgetUsers = jsonDecode(response.body);
        u_id = widgetUsers[0]['id'];
        u_kodeuser = widgetUsers[0]['kode_user'];
        u_username = widgetUsers[0]['username'];
        u_namalengkap = widgetUsers[0]['nama_lengkap'];
      });
    }
  }

}

void showExitConfirm() {}

void showDialogUbah(context) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 10.0),
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
                          icon: const Icon(Icons.close),
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
                    const Divider(indent: 20, endIndent: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
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
                        margin: const EdgeInsets.all(25),
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
                  padding: const EdgeInsets.only(left: 25.0, right: 10.0),
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
                          icon: const Icon(Icons.close),
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
                          // isDense: true,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                            ),
                            isDense: true,
                            itemHeight: null,
                            hint: const Text("Pilih Bank Tujuan"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: bankDipilih,
                            items: bank.map((String value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (String? value) {
                              {
                                bankDipilih = value!;
                              }
                            }))
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
                  margin: const EdgeInsets.all(25),
                  child: Row(children: <Widget>[
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
                  ]))
            ]);
      });
}
