import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          centerTitle: true,
          title: const Text(
            'About',
            style: TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: Color(0xFF6A2B84),
          foregroundColor: Colors.white,
        ),
        body: ListView(children: [
          Container(
              height: 300,
              color: Color(0xFF6A2B84),
              padding: EdgeInsets.only(top: 80),
              child: Column(children: [
                Image.asset('assets/images/ceria256white.png', width: 100),
                const Text('CeriaApp',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoppinsMedium',
                        fontSize: 18)),
                const Text('Versi 1.0.2',
                    style: TextStyle(color: Colors.white, fontSize: 10))
              ])),

          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Deskripsi',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 13, fontFamily: 'PoppinsBlack')),
                Text(
                    'Ceria (Cerita Indonesia) merupakan sebuah aplikasi '
                    'yang didalamnya memiliki berbagai jenis cerita mulai dari Cerita Rakyat, Biografi, Novel dll.\n',
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'PoppinsMedium',
                        height: 2,
                        wordSpacing: 1.5)),
                Text('Pengembang',
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'PoppinsBlack',
                        height: 2,
                        wordSpacing: 1.5)),
                Text(
                    'Wahyu Widodo \n'
                    'Devani Laras Sati\n'
                    'Nila Nazilatul Mazaya\n'
                    'Fitroh Izatul Malkiyah',
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'PoppinsMedium',
                        height: 2,
                        wordSpacing: 1.5)),
              ],
            ),
          )
        ]));
  }
}
