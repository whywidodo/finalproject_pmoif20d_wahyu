import 'package:flutter/material.dart';

class CeritaFavorite extends StatefulWidget {
  const CeritaFavorite({Key? key}) : super(key: key);

  @override
  State<CeritaFavorite> createState() => _CeritaFavoriteState();
}

class _CeritaFavoriteState extends State<CeritaFavorite> {
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
          'Cerita Favorite',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
    ));
  }}

