import 'package:finalproject_pmoif20d_wahyu/BacaCerita.dart';
import 'package:finalproject_pmoif20d_wahyu/HomePage.dart';
import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:finalproject_pmoif20d_wahyu/SampleBacaanGratis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'PembelianCerita.dart';
import 'SampleBacaan Berbayar.dart';

class DetailCeritaGratis extends StatefulWidget {
  const DetailCeritaGratis({Key? key}) : super(key: key);

  @override
  State<DetailCeritaGratis> createState() => _DetailCeritaGratisState();
}

class _DetailCeritaGratisState extends State<DetailCeritaGratis> {
  bool _isFavorited = false;
  int _favoriteCount = 0;
  String text = 'Isi Text Sharing Ceritanya';
  String sub = 'Subjek Cerita';

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
          'Detail Cerita',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: text.isEmpty ? null : () => _onShare(context),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding:
            const EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          c_judulcerita,
                          style: const TextStyle(
                              fontSize: 16, fontFamily: 'PoppinsBlack'),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                c_ceritacreated,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'PoppinsMedium',
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerRight,
                        icon: (_isFavorited
                            ? const Icon(Icons.star, color: Colors.yellow,)
                            : const Icon(Icons.star_border)),
                        color: Colors.black,
                        iconSize: 30,
                        onPressed: _toggleFavorite,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(0),
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
                  margin: EdgeInsets.only(left: 10),
                  height: 200,
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Kategori',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'PoppinsBlack')),
                      Text(
                          c_kodekategori,
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'PoppinsMedium')),
                      const Text('Ringkasan',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'PoppinsBlack')),
                      Text(
                          c_txtceritasample,
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'PoppinsMedium'),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,  left: 40),
            child: Row(
              children: [
                tombolGratisBayar(),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if(c_statuscerita == "Gratis") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BacaCerita()),
                      );
                    }else{
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SampleBacaanBerbayar()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      minimumSize: const Size(140, 40),
                      maximumSize: const Size(140, 40),
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                      onSurface: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: const TextStyle(
                          fontFamily: 'PoppinsThin', fontSize: 15)),
                  icon: const Icon(
                    Icons.list_alt_rounded,
                    size: 20,
                  ),
                  label: Text('Baca Cerita'),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: Divider(
                color: Colors.black12,
                thickness: 1,
                height: 30,
              )),
          Container(
            margin: EdgeInsets.only(left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cerita Lainnya',
                  style: TextStyle(fontSize: 12, fontFamily: 'PoppinsBlack'),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 25, top: 10),
              height: 200,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/ceria256white.png')),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/ceria256white.png')),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/ceria256white.png')),
                        ),
                      )),
                ),
              ]))
        ],
      ),
    );
  }
  
  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      text,
      subject: sub,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  Widget tombolGratisBayar() {
    if(c_statuscerita == "Gratis"){
      return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(140, 40),
            maximumSize: const Size(140, 40),
            primary: Colors.grey,
            onPrimary: Colors.white,
            onSurface: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)),
            textStyle: const TextStyle(
                fontFamily: 'PoppinsThin', fontSize: 15)),
        // icon: const Icon(null),
        child: const Text('Gratis'),
      );
    }
    else{
      return ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => PembelianCerita()));
        },
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(140, 40),
            maximumSize: const Size(140, 40),
            primary: Colors.purple,
            onPrimary: Colors.white,
            onSurface: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)),
            textStyle: const TextStyle(
                fontFamily: 'PoppinsThin', fontSize: 13)),
        icon: const Icon(
          Icons.shopping_cart,
          size: 18,
        ),
        label: Text('Rp. 10.000,-'),
      );
    }
  }
}
