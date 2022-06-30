import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CeritaFavorite extends StatefulWidget {
  const CeritaFavorite({Key? key}) : super(key: key);

  @override
  _CeritaFavoriteState createState() => _CeritaFavoriteState();
}

class _CeritaFavoriteState extends State<CeritaFavorite> {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: const Text(
            'Cerita Favorite',
            style: TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: const Color(0xFF6A2B84),
        ),
        body: ListView(scrollDirection: Axis.vertical,
            children:[
              Container(
                padding:
                const EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 10),
                child: Row(
                    children:[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10, right: 30),
                                child: Row(
                                    children:[
                                      Container(
                                        margin: EdgeInsets.all(0),
                                        padding: const EdgeInsets.all(0),
                                        height: 200,
                                        width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.purple,
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage('assets/images/ceria256white.png'),
                                              )
                                          )
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          padding:
                                          const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 40),
                                          height: 200,
                                          width: 150,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Malin Kundang',
                                                  style: TextStyle(
                                                      fontSize: 14, fontFamily: 'PoppinsBlack'
                                                  )
                                              ),
                                              Text(
                                                'Zaman dahulu kala ada sebuah cerita di sebuah perkampungan nelayan Pantai Air Manis di Padang, Sumatera Barat',
                                                  style: TextStyle(
                                                      fontSize: 12, fontFamily: 'PoppinsMedium'),
                                              textAlign: TextAlign.justify
                                              ),
                                            ],
                                          )
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.all(0),
                                              padding: const EdgeInsets.only(right: 30, left: 30, top: 0, bottom: 10),
                                              height: 200,
                                              width: 150,
                                              child: IconButton(
                                                padding: const EdgeInsets.all(0),
                                                alignment: Alignment.topRight,
                                                icon:(_isFavorited
                                                    ? const Icon(Icons.star, color: Colors.yellow,)
                                                    : const Icon(Icons.star_border)),
                                                color: Colors.black,
                                                iconSize: 30,
                                                onPressed: _toggleFavorite,
                                              )
                                          )
                                        ]
                                      )
                                        ],
                            )
                            )],
                        )
                      ),
                                    ]
                                )
                            ),
                      //NILA
            ]
        )
    );

  }
}
