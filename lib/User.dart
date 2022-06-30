import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:finalproject_pmoif20d_wahyu/DetailCeritaGratis.dart';
import 'package:finalproject_pmoif20d_wahyu/HomePage.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'EditCerita.dart';
import 'TambahCerita.dart';
import 'HomePage.dart';
import './API/CallApi.dart';

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

class _UserState extends ResumableState<User> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  double tinggiBox = 0;
  List widgetUsers = [];
  List widgetCeritaUsers = [];
  TextEditingController txtEditNamaLengkap = new TextEditingController();
  TextEditingController txtEditEmail = TextEditingController();
  TextEditingController txtEditUsername = TextEditingController();
  TextEditingController txtEditPassword = TextEditingController();
  TextEditingController txtEditPasswordBaru1 = TextEditingController();
  TextEditingController txtEditPasswordBaru2 = TextEditingController();
  var txtPasswordLogin = u_password;

  @override
  void initState() {
    super.initState();
    loadDataUsers();
    loadDataCeritaUsers();
  }

  @override
  void onResume() {
    loadDataCeritaUsers();
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
                              'Rp 100.000,-',
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
                                    fontFamily: 'PoppinsMedium', fontSize: 11)),
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
                                    fontFamily: 'PoppinsMedium', fontSize: 11)),
                            icon: const Icon(
                              Icons.credit_card_outlined,
                              size: 15,
                            ),
                            label: const Text('Tarik Komisi')),
                        ElevatedButton.icon(
                            onPressed: () {
                              showDialogUbah();
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
                                    fontFamily: 'PoppinsMedium', fontSize: 11)),
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 15,
                            ),
                            label: const Text('Edit Profil')),
                      ],
                    ),
                  )
                ])),
        SizedBox(
          width: double.infinity,
          height: tinggiBox,
          child: ListView.builder(
            itemCount: widgetCeritaUsers.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF9B5DB5),
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widgetCeritaUsers[index]["judul_cerita"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'PoppinsMedium',
                              fontSize: 13),
                        ),
                        Container(
                            child: Row(children: <Widget>[
                          IconButton(
                            onPressed: () {
                              c_id = widgetCeritaUsers[index]["id"];
                              c_judulcerita =
                                  widgetCeritaUsers[index]["judul_cerita"];
                              c_kodekategori =
                                  widgetCeritaUsers[index]["kode_kategori"];
                              c_txtceritasample =
                                  widgetCeritaUsers[index]["txt_cerita_sample"];
                              c_txtceritafull =
                                  widgetCeritaUsers[index]["txt_cerita_full"];
                              c_statuscerita =
                                  widgetCeritaUsers[index]["status_cerita"];
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EditCerita()),
                                  (route) => false);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const EditCerita()));
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
                                  headerAnimationLoop: true,
                                  animType: AnimType.SCALE,
                                  title: 'Hapus',
                                  desc:
                                      'Apa anda yakin akan menghapus cerita ini?',
                                  buttonsTextStyle:
                                      const TextStyle(color: Colors.white),
                                  btnCancelText: "Tidak",
                                  btnOkText: "Ya",
                                  btnOkColor: const Color(0xFF6A2B84),
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    c_kodecerita =
                                        '${widgetCeritaUsers[index]["id"]}';
                                    c_judulcerita =
                                        '${widgetCeritaUsers[index]["judul_cerita"]}';
                                    hapusDataCeritaUsers(
                                        c_kodecerita, c_judulcerita);
                                  },
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
                              c_kodecerita =
                                  '${widgetCeritaUsers[index]["id"]}';
                              c_judulcerita =
                                  '${widgetCeritaUsers[index]["judul_cerita"]}';
                              c_kodekategori =
                                  '${widgetCeritaUsers[index]["kode_kategori"]}';
                              c_txtceritasample =
                                  '${widgetCeritaUsers[index]["txt_cerita_sample"]}';
                              c_txtceritafull =
                                  '${widgetCeritaUsers[index]["txt_cerita_sample"]}';
                              c_ceritacreated =
                                  '${widgetCeritaUsers[index]["created_at"]["date"]}';

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
                      ]));
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }

  Future<void> loadDataCeritaUsers() async {
    var dataURL = Uri.parse(baseURL + 'ceritakode/$u_email');
    http.Response response = await http.get(dataURL);

    if (response.statusCode == 400) {
      tinggiBox = 0;
      widgetCeritaUsers.length = 0;
    } else {
      setState(() {
        widgetCeritaUsers = jsonDecode(response.body);
        // print(widgetCeritaUsers.length);
        // print(widgetCeritaUsers);
      });
      tinggiBox = 400;
    }
  }

  Future<void> hapusDataCeritaUsers(idcerita, judulcerita) async {
    var dataCerita = {'id': idcerita};
    var res =
        CallApi().delDataCerita(dataCerita, 'ceritahapus/' + idcerita, context);
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
          const SizedBox(
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
    if ('$u_email' != "") {
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

  void showExitConfirm() {}

  void showDialogUbah() {
    print(txtPasswordLogin);
    txtEditNamaLengkap.text = u_namalengkap;
    txtEditEmail.text = u_email;
    txtEditUsername.text = u_username;
    txtEditPassword.text = "";
    txtEditPasswordBaru1.text = "";
    txtEditPasswordBaru2.text = "";

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
                          child: TextFormField(
                              controller: txtEditNamaLengkap,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Nama Lengkap',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: TextFormField(
                              controller: txtEditUsername,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Email',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: TextFormField(
                              controller: txtEditEmail,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Email',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: TextFormField(
                              controller: txtEditPassword,
                              obscureText: true,
                              obscuringCharacter: "*",
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))),
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
                          child: TextFormField(
                              controller: txtEditPasswordBaru1,
                              obscureText: true,
                              obscuringCharacter: "*",
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Password Baru',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: TextFormField(
                              controller: txtEditPasswordBaru2,
                              obscureText: true,
                              obscuringCharacter: "*",
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Ulangi Password',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))),
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
                                      // Navigator.pop(context);
                                      _validateEditProfil();
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

  void _validateEditProfil() {
    var bytes = utf8.encode(txtEditPassword.text);
    var digest = md5.convert(bytes);
    String passEdit = digest.toString();

    if (passEdit == txtPasswordLogin) {
      if (txtEditPasswordBaru1.text == "" && txtEditPasswordBaru2.text == "") {
        // Tidak merubah password
        doEditProfil(txtEditNamaLengkap.text, txtEditUsername.text,
            txtEditEmail.text, txtEditPassword.text);
        // print("Proses edit profil tanpa rubah password berjalan.");
      } else {
        // Password baru ada nilainya
        if (txtEditPasswordBaru1.text == txtEditPasswordBaru2.text) {
          // Password baru keduanya sama
          // doEditProfilPassword();
          print("Proses edit profil dengan rubah password berjalan.");
          print(txtEditPasswordBaru1.text);
          print(txtEditPasswordBaru2.text);
        } else {
          // Password baru keduanya tidak sama
          // Alert password baru harus sama
          print("Edit profil dengan rubah password gagal.");
          print(txtEditPasswordBaru1.text);
          print(txtEditPasswordBaru2.text);
        }
      }
    } else {
      // Password tidak sama
      // Alert password utama harus sama
      print("Proses edit profil tanpa rubah password gagal.");
      print(txtEditPassword.text);
    }
  }

  doEditProfil(namalengkap, username, email, password) async {
    var data = {
      'username': username,
      'nama_lengkap': namalengkap,
      // 'email': email,
      'password': password,
    };
    bool res =
        await CallApi().putDataEditUser(data, 'usersedit/$u_id', context);
  }
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
                              fontSize: 18,
                              fontFamily: 'PoppinsMedium',
                              color: Color(0xFF6A2B84)),
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
                      child: TextFormField(
                          decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Jumlah Penarikan',
                              labelStyle:
                                  const TextStyle(color: Color(0xFF6A2B84)),
                              hintText: 'Jumlah Penarikan',
                              contentPadding: EdgeInsets.all(14),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF6A2B84), width: 1.2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6A2B84)),
                              )),
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.black54)),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF6A2B84), width: 1.2)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF6A2B84))),
                            ),
                            isDense: true,
                            itemHeight: null,
                            hint: const Text("Kategori Cerita"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: bankDipilih,
                            items: bank.map((String value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (String? value) {
                              bankDipilih = value!;
                            }))
                  ])),
              Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Nama Pemilik Rekening',
                          labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                          hintText: 'Nama Pemilik Rekening',
                          contentPadding: EdgeInsets.all(14),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF6A2B84), width: 1.2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6A2B84)),
                          )),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54))),
              Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Nomor Rekening',
                          labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                          hintText: 'Nomor Rekening',
                          contentPadding: EdgeInsets.all(14),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF6A2B84), width: 1.2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6A2B84)),
                          )),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54))),
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
