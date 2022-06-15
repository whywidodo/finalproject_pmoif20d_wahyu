import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleBacaanGratis extends StatefulWidget {
  const SampleBacaanGratis({Key? key}) : super(key: key);

  @override
  _SampleBacaanGratisState createState() => _SampleBacaanGratisState();
}
class _SampleBacaanGratisState extends State<SampleBacaanGratis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Malin Kundang',
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
