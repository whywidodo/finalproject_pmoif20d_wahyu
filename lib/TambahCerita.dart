import 'package:finalproject_pmoif20d_wahyu/User.dart';
import 'package:flutter/material.dart';

List<String> cerita = ["Pilih Kategori Cerita", "Novel", "Dongeng", "Cerpen", "Biografi"];
String ceritaDipilih = "Pilih Kategori Cerita";

class TambahCerita extends StatefulWidget {
  const TambahCerita({Key? key}) : super(key: key);

  @override
  _TambahCeritaState createState() => _TambahCeritaState();
}

class _TambahCeritaState extends State<TambahCerita> {
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
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 10),
              child: const TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                labelText: 'Judul Cerita',
                isDense: true,
                contentPadding: EdgeInsets.all(14),
              ))),
          Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  isDense: true,
                  itemHeight: null,
                  hint: const Text("Kategori Cerita"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: bankDipilih,
                  items: bank.map((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? value) {
                    {
                      bankDipilih = value!;
                    }
                  })),
          Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 5, bottom: 10),
              child: const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Tulis Cerita',
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
        ]));
  }
}
