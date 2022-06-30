import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './API/CallApi.dart';
import 'User.dart';

List<String> cerita = [
  "Pilih Kategori Cerita",
  "Novel",
  "Dongeng",
  "Cerpen",
  "Biografi"
];
List<String> status = [
  "Pilih Status Cerita",
  "Gratis",
  "Berbayar"
];

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

  @override
  Widget build(BuildContext context) {
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
                            hint: const Text("Kategori Cerita"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: ceritaDipilih,
                            items: cerita.map((String value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                ceritaDipilih = value!;
                              });
                              {}
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
                            'Tulis Cerita',
                            style: TextStyle(
                                color: Color(0xFF6A2B84),
                                fontFamily: 'PoppinsMedium',
                                fontSize: 12),
                          ),
                          TextFormField(
                              controller: txtCeritaIsi,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              minLines: null,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Tuliskan cerita',
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
                          'Status Cerita',
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
                            hint: const Text("Pilih Status Cerita"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: statusDipilih,
                            items: status.map((String value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value));
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

  void _validateProses() {
    if (ceritaDipilih != 'Pilih Kategori Cerita' && statusDipilih != 'Pilih Status Cerita'){
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        lakukanProses(
            txtCeritaJudul.text, txtCeritaSample.text, txtCeritaIsi.text);
      } else {
        // showAlertGagalTambah();
      }
    }else{
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Tambah Cerita Gagal',
          desc: 'Silahkan pilih kategori atau status cerita',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red
      ).show();
    }
  }

  lakukanProses(judulCerita, ringkasanCerita, isiCerita) async {
    var data = {
      "judul_cerita": judulCerita,
      "kode_kategori": ceritaDipilih,
      "txt_cerita_sample": ringkasanCerita,
      "txt_cerita_full": isiCerita,
      "sampul_cerita": "null",
      "status_cerita": statusDipilih,
      "kode_user": u_email
    };
    print(data);
    bool res = await CallApi().postDataTambahCerita(data, 'cerita', context);
  }
}
