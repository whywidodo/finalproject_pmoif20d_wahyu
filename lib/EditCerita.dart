import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:finalproject_pmoif20d_wahyu/TambahCerita.dart';
import 'package:finalproject_pmoif20d_wahyu/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'API/CallApi.dart';
import 'User.dart';

List<String> status = ["Gratis", "Berbayar"];

class EditCerita extends StatefulWidget {
  const EditCerita({Key? key}) : super(key: key);

  @override
  _EditCeritaState createState() => _EditCeritaState();
}

class _EditCeritaState extends State<EditCerita> {
  TextEditingController txtEditJudulCerita = new TextEditingController();
  TextEditingController txtEditRingkasan = new TextEditingController();
  TextEditingController txtEditIsiCerita = new TextEditingController();

  List widgetKategori = [];
  String kategori_value = "";

  @override
  void initState() {
    super.initState();
    txtEditJudulCerita.text = c_judulcerita;
    txtEditRingkasan.text = c_txtceritasample;
    txtEditIsiCerita.text = c_txtceritafull;
    loadDataKategori();
    kategori_value = c_kodekategori;
    statusDipilih = c_statuscerita;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => User()));
            },
          ),
          centerTitle: true,
          title: const Text(
            'Edit Detail Cerita',
            style: TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: const Color(0xFF6A2B84),
        ),
        body: ListView(children: [
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
                        controller: txtEditJudulCerita,
                        decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(14),
                            fillColor: Colors.white,
                            hintText: 'Tuliskan Judul Cerita',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF6A2B84), width: 1.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6A2B84)),
                            )),
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.black54))
                  ])),
          Container(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                            borderSide: BorderSide(color: Color(0xFF6A2B84))),
                      ),
                      isDense: true,
                      itemHeight: null,
                      hint: const Text("Kategori Cerita"),
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
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                        controller: txtEditRingkasan,
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
                              borderSide: BorderSide(color: Color(0xFF6A2B84)),
                            )),
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.black54))
                  ])),

          Container(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                            borderSide: BorderSide(color: Color(0xFF6A2B84))),
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
                        {
                          statusDipilih = value!;
                        }
                      })
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
            margin:
            const EdgeInsets.only(left: 20, right: 260, top: 5, bottom: 5),
            color: const Color(0xFFc4aacf),
            child: IconButton(
                onPressed: () {},
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
                      },
                      child: const Text("Update",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'PoppinsMedium',
                            color: Color(0xffffffff),
                          ))),
                )
              ]))
        ]));
  }

  Future<void> loadDataKategori() async {
    var dataURL = Uri.parse(baseURL + 'kategori');
    http.Response response = await http.get(dataURL);

    setState(() {
      widgetKategori = jsonDecode(response.body);
    });
  }

  void _validateProses() {
    if (kategori_value != null && statusDipilih != null) {
      lakukanProses(txtEditJudulCerita.text, kategori_value,
          txtEditRingkasan.text, "null", statusDipilih);
    } else {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Edit Cerita Gagal',
          desc: 'Silahkan pilih kategori atau status cerita',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
          .show();
    }
  }

  lakukanProses(judulCerita, kategoriCerita, ringkasanCerita, isiCerita, statusCerita) async {
    var data = {
      "judul_cerita": judulCerita,
      "kode_kategori": kategoriCerita,
      "txt_cerita_sample": ringkasanCerita,
      "txt_cerita_full": isiCerita,
      "sampul_cerita": "null",
      "status_cerita": statusCerita,
      "kode_user": u_email
    };
    bool res =
    await CallApi().putDataEditCerita(data, 'ceritaedit/$c_id', context);
  }
}
