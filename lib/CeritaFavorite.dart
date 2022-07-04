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
  List<bool> boolList = [true, true, true, true, true, true, true];

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
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: boolList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(3),
                  child: Expanded(
                      child: Row(
                        children:[
                          Container(
                              margin: const EdgeInsets.only(left: 10, top: 5),
                              padding: const EdgeInsets.all(0),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/ceria256white.png'),
                                  )
                              )
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10, top: 5),
                              height: 100,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Malin $index',
                                      style: const TextStyle(
                                          fontSize: 12, fontFamily: 'PoppinsBlack'
                                      )
                                  ),
                                  const Text(
                                      'Zaman dahulu kala ada sebt',
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'PoppinsMedium'),
                                      textAlign: TextAlign.justify
                                  ),
                                ],
                              )
                          ),
                                Container(
                                    padding: const EdgeInsets.only(right: 30, left: 30, top: 0, bottom: 10),
                                    height: 100,
                                    width: 100,
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      alignment: Alignment.center,
                                      icon:(boolList[index]
                                          ? const Icon(Icons.star, color: Colors.yellow,)
                                          : const Icon(Icons.star_border)),
                                      color: Colors.black,
                                      iconSize: 30,
                                      onPressed: (){
                                        // _toggleFavorite();
                                        boolList[index] = !boolList[index];
                                        setState(() {});
                                      },
                                    )
                                )
                        ],
                      )
                  )
              );
            },
                      //NILA

        )
    );

  }
}
