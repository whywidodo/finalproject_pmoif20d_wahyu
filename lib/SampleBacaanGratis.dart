import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SampleBacaanGratis extends StatefulWidget {
  const SampleBacaanGratis({Key? key}) : super(key: key);

  @override
  _SampleBacaanGratisState createState() => _SampleBacaanGratisState();
}
class _SampleBacaanGratisState extends State<SampleBacaanGratis> {
  String text = 'Isi Text Sharing Ceritanya';
  String sub = 'Subjek Cerita';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          c_judulcerita,
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
      body: ListView(scrollDirection: Axis.vertical,
          children: [
            Container(
                height: 200,
                color: Color(0xFF6A2B84),
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Text(c_judulcerita,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'PoppinsMedium',
                            fontSize: 18
                        )),
                    Image.asset('assets/images/ceria256white.png', width: 20),
                  ],
                )
            ),
            Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          c_txtceritafull,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'PoppinsMedium',
                              height: 2,
                              wordSpacing: 1.5
                          )),
                    ]
                )
            )
          ]
      )
    );
  }
  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        text,
        subject: sub,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
//NILA