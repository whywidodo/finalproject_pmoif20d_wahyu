import 'package:flutter/material.dart';

class DetailCeritaGratis extends StatefulWidget {
  const DetailCeritaGratis({Key? key}) : super(key: key);

  @override
  State<DetailCeritaGratis> createState() => _DetailCeritaGratisState();
}

class _DetailCeritaGratisState extends State<DetailCeritaGratis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              print('clicked once');
            },
          ),
          centerTitle: true,
          title: const Text(
            'Detail Cerita',
            style: TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: const Color(0xFF6A2B84),
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(children: [
          Container(
            margin: EdgeInsets.only(left: 30, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ayat-Ayat Cinta',
                  style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
                ),
                Text('Autor Satu, Mei 2021',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'PoppinsMedium')),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(5),
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage('assets/images/ceria256white.png'))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(135, 35),
                              maximumSize: const Size(135, 35),
                              primary: Colors.grey,
                              onPrimary: Colors.white,
                              onSurface: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              textStyle: const TextStyle(
                                  fontFamily: 'PoppinsMedium', fontSize: 13)),
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 15,
                          ),
                          label: Text('Gratis')),
                      ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(135, 35),
                              maximumSize: const Size(135, 35),
                              primary: Color(0xFF6A2B84),
                              onPrimary: Colors.white,
                              onSurface: Colors.purple,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              textStyle: const TextStyle(
                                  fontFamily: 'PoppinsMedium', fontSize: 13)),
                          icon: const Icon(
                            Icons.list_alt_rounded,
                            size: 15,
                          ),
                          label: Text('Baca Cerita')),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}