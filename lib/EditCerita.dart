import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> cerita = [
  "Pilih Kategori Cerita",
  "Novel",
  "Dongeng",
  "Cerpen",
  "Biografi"
];
String ceritaDipilih = "Pilih Kategori Cerita";

class EditCerita extends StatefulWidget {
  const EditCerita({Key? key}) : super(key: key);

  @override
  _EditCeritaState createState() => _EditCeritaState();
}

class _EditCeritaState extends State<EditCerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                      value: ceritaDipilih,
                      items: cerita.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        {
                          ceritaDipilih = value!;
                        }
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
                      'Tulis Cerita',
                      style: TextStyle(
                          color: Color(0xFF6A2B84),
                          fontFamily: 'PoppinsMedium',
                          fontSize: 12),
                    ),
                    TextFormField(
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
                              borderSide: BorderSide(color: Color(0xFF6A2B84)),
                            )),
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.black54))
                  ])),
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
                        Navigator.pop(context);
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
}
