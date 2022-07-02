import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './API/CallApi.dart';
import 'User.dart';

List<String> status = ["Gratis", "Berbayar"];

class TambahCerita extends StatefulWidget {
  const TambahCerita({Key? key}) : super(key: key);

  @override
  _TambahCeritaState createState() => _TambahCeritaState();
}

class _TambahCeritaState extends State<TambahCerita> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var txtCeritaJudul = TextEditingController();
  var txtCeritaIsi = TextEditingController();
  var txtCeritaSample = TextEditingController();

  List widgetKategori = [];
  String kategori_value = "";

  void initState() {
    super.initState();
    statusDipilih = "";
    loadDataKategori();
  }

  @override
  Widget build(BuildContext context) {
    // print(status);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tambah Cerita',
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
                            'Judul Cerita',
                            style: TextStyle(
                                color: Color(0xFF6A2B84),
                                fontFamily: 'PoppinsMedium',
                                fontSize: 12),
                          ),
                          TextFormField(
                              controller: txtCeritaJudul,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Tuliskan judul',
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
                          'Kategori Cerita',
                          style: TextStyle(
                              color: Color(0xFF6A2B84),
                              fontFamily: 'PoppinsMedium',
                              fontSize: 12),
                        ),
                        DropdownButtonFormField(
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
                            hint: const Text("Kategori Cerita", style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 12)),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: kategori_value.isNotEmpty ? kategori_value : null,
                            items: widgetKategori.map((item) {
                              return DropdownMenuItem(
                                value: item['nama_kategori'].toString(),
                                child: Text(item['nama_kategori'].toString(), style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 12)),
                              );
                            }).toList(),
                            onChanged: (Object? value) {
                              setState(() {
                                kategori_value = value.toString();
                              });
                            })
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tulis Ringkasan',
                            style: TextStyle(
                                color: Color(0xFF6A2B84),
                                fontFamily: 'PoppinsMedium',
                                fontSize: 12),
                          ),
                          TextFormField(
                              controller: txtCeritaSample,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              minLines: null,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Tuliskan Ringkasan Cerita',
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
                          'Gratis atau Berbayar',
                          style: TextStyle(
                              color: Color(0xFF6A2B84),
                              fontFamily: 'PoppinsMedium',
                              fontSize: 12),
                        ),
                        DropdownButtonFormField(
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
                            hint: const Text("Gratis/Berbayar", style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 12)),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: statusDipilih.isNotEmpty ? statusDipilih : null,
                            items: status.map((String value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value, style: const TextStyle(fontFamily: 'PoppinsMedium', fontSize: 12)));
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                statusDipilih = value!;
                              });
                              {}
                            })
                      ],
                    )),
                Container(
                  margin:
                  EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: const Text(
                    "Upload Sampul Cerita",
                    style: TextStyle(
                        color: Color(0xFF6A2B84),
                        fontSize: 12,
                        fontFamily: 'PoppinsMedium'),
                  ),
                ),
                Container(
                  height: 130,
                  margin: const EdgeInsets.only(
                      left: 20, right: 260, top: 5, bottom: 5),
                  color: const Color(0xFFc4aacf),
                  child: IconButton(
                      onPressed: () {
                        // _getImage;
                      },
                      icon: const Icon(Icons.cloud_upload,
                          size: 30, color: Color(0xFF6A2B84))),
                ),
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
                              _validateProses();
                              // Navigator.pop(context);
                            },
                            child: const Text("Proses",
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

  Future<void> loadDataKategori() async {
    var dataURL = Uri.parse(baseURL + 'kategori');
    http.Response response = await http.get(dataURL);

    setState(() {
      widgetKategori = jsonDecode(response.body);
      // kategori_data = widgetKategori;
    });
  }

  void _validateProses() {
    if (kategori_value != null && statusDipilih !=null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        lakukanProses(txtCeritaJudul.text, kategori_value, txtCeritaSample.text,
            "null", statusDipilih);
      } else {
        // showAlertGagalTambah();
      }
    } else {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Tambah Cerita Gagal',
          desc: 'Silahkan pilih kategori atau status cerita',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
          .show();
    }
  }

  lakukanProses(judulCerita, kategoriCerita, ringkasanCerita, isiCerita,
      statusCerita) async {
    var data = {
      "judul_cerita": judulCerita,
      "kode_kategori": kategoriCerita,
      "txt_cerita_sample": ringkasanCerita,
      "txt_cerita_full": isiCerita,
      "sampul_cerita": "null",
      "status_cerita": statusCerita,
      "kode_user": u_email
    };
    print(data);
    bool res = await CallApi().postDataTambahCerita(data, 'cerita', context);
  }
}
