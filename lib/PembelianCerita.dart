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
            style: TextStyle(fontFamily:'PoppinsMedium'),
          ),
          backgroundColor: const Color(0xFF6A2B84),
          actions:[
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
            )

          ]
      )
    );
  }
}


