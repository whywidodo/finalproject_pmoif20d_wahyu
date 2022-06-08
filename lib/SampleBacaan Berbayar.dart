import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleBacaanBerbayar extends StatefulWidget {
  const SampleBacaanBerbayar({Key? key}) : super(key: key);

  @override
  _SampleBacaanBerbayarState createState() => _SampleBacaanBerbayarState();
}
class _SampleBacaanBerbayarState extends State<SampleBacaanBerbayar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ayat-ayat Cinta',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
            },
          )
        ],

      ),
    );
  }
}
