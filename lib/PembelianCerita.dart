import 'package:flutter/material.dart';

class PembelianCerita extends StatefulWidget {

  const PembelianCerita({Key? key}) : super(key: key);
  @override
  _PembelianCeritaState createState() => _PembelianCeritaState();
}



class _PembelianCeritaState extends State<PembelianCerita> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pembelian Cerita',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
      ),
      body: ListView(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: const EdgeInsets.all(0),
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/ceria256white.png'),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 30),
                  height: 200,
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Judul',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'PoppinsBlack')),
                      Text("Ayat-Ayat Cinta",
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'PoppinsMedium')),
                      const Text('Penulis',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'PoppinsBlack')),
                      Text("Author1",
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'PoppinsMedium')),
                      const Text('Ringkasan',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'PoppinsBlack')),
                      Text("Ringkasan Cerita",
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'PoppinsMedium'),
                          textAlign: TextAlign.justify),
                      const Text('Jumlah Halaman',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'PoppinsBlack')),
                      Text("300 Halaman",
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'PoppinsMedium'),
                          textAlign: TextAlign.justify),
                      const Text('Harga',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'PoppinsBlack')),
                      Text("Rp. 10.000",
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'PoppinsMedium'),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
                Container(

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
