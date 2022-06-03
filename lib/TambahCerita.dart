import 'package:finalproject_pmoif20d_wahyu/User.dart';
import 'package:flutter/material.dart';

class TambahCerita extends StatefulWidget {
  const TambahCerita({Key? key}) : super(key: key);

  @override
  _TambahCeritaState createState() => _TambahCeritaState();
}

class _TambahCeritaState extends State<TambahCerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => User()));
          },
        ),
        centerTitle: true,
        title: const Text(
          'Tambah Cerita',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
      ),
    );
  }
}
