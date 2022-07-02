import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:finalproject_pmoif20d_wahyu/API/CallApi.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class TambahBabCerita extends StatefulWidget {
  const TambahBabCerita({Key? key}) : super(key: key);

  @override
  _TambahBabCeritaState createState() => _TambahBabCeritaState();
}

class _TambahBabCeritaState extends State<TambahBabCerita> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var txtJudulBab = TextEditingController();
  var txtIsiBab = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => User()));
        },
      ),
      centerTitle: true,
      title: const Text(
        'Tambah Isi Cerita',
        style: TextStyle(fontFamily: 'PoppinsMedium'),
      ),
      backgroundColor: const Color(0xFF6A2B84),
    ),
        body: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Form(
              key: _formKey,
              child: ListView(children: [
                Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Judul BAB',
                            style: TextStyle(
                                color: Color(0xFF6A2B84),
                                fontFamily: 'PoppinsMedium',
                                fontSize: 12),
                          ),
                          TextFormField(
                              controller: txtJudulBab,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'BAB 1',
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
                                  fontSize: 12.0, color: Colors.black54))
                        ])),
                Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Isi BAB',
                            style: TextStyle(
                                color: Color(0xFF6A2B84),
                                fontFamily: 'PoppinsMedium',
                                fontSize: 12),
                          ),
                          TextFormField(
                              controller: txtIsiBab,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              minLines: null,
                              maxLines: 15,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Tuliskan isi BAB cerita',
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
                                  fontSize: 12.0, color: Colors.black54))
                        ])),
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
                              // _validateProses();
                              // Navigator.pop(context);
                            },
                            child: const Text("Tambah",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'PoppinsMedium',
                                  color: Color(0xffffffff),
                                ))),
                      )
                    ]))
              ]),
            )));
  }
//     void _validateProses() {
//       if (ceritaDipilih != 'Pilih Kategori Cerita' && statusDipilih != 'Pilih Status Cerita'){
//         if (_formKey.currentState!.validate()) {
//           _formKey.currentState!.save();
//           lakukanProses(
//               txtCeritaJudul.text, ceritaDipilih, txtCeritaSample.text, txtCeritaIsi.text, statusDipilih);
//         } else {
//           // showAlertGagalTambah();
//         }
//       }else{
//         AwesomeDialog(
//             context: context,
//             dialogType: DialogType.ERROR,
//             animType: AnimType.SCALE,
//             headerAnimationLoop: true,
//             title: 'Tambah Cerita Gagal',
//             desc: 'Silahkan pilih kategori atau status cerita',
//             btnOkOnPress: () {},
//             btnOkIcon: Icons.cancel,
//             btnOkColor: Colors.red
//         ).show();
//       }
//     }
//
//     lakukanProses(judulCerita, kategoriCerita, ringkasanCerita, isiCerita, statusCerita) async {
//       var data = {
//         "judul_cerita": judulCerita,
//         "kode_kategori": kategoriCerita,
//         "txt_cerita_sample": ringkasanCerita,
//         "txt_cerita_full": isiCerita,
//         "sampul_cerita": "null",
//         "status_cerita": statusCerita,
//         "kode_user": u_email
//       };
//       print(data);
//       bool res = await CallApi().postDataTambahCerita(data, 'cerita', context);
//     }
}
