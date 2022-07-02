import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:finalproject_pmoif20d_wahyu/API/CallApi.dart';
import 'package:finalproject_pmoif20d_wahyu/EditBabCerita.dart';
import 'package:finalproject_pmoif20d_wahyu/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import './API/CallApi.dart';

import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'User.dart';

class BacaCerita extends StatefulWidget {
  const BacaCerita({Key? key}) : super(key: key);

  @override
  _BacaCeritaState createState() => _BacaCeritaState();
}

class _BacaCeritaState extends State<BacaCerita> {
  String text = 'Isi Text Sharing Ceritanya';
  String sub = 'Subjek Cerita';

  List widgetBabCerita = [];
  String kategori_value = "";

  void initState() {
    super.initState();
    loadDataBab();
    print(c_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          c_judulcerita,
          style: const TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: text.isEmpty ? null : () => _onShare(context),
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: widgetBabCerita.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                        child: Column(
                          children: [
                            SizedBox(
                              //You can define in as your screen's size width,
                              //or you can choose a double
                              //ex:
                              //width: 100,
                              width: (MediaQuery.of(context).size.width) - 35, //this is the total width of your screen
                              child: Text(widgetBabCerita[index]["judul_bab"],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: 14
                                  )),
                            ),
                            SizedBox(
                      width: (MediaQuery.of(context).size.width) - 35, //this is the total width of your screen
                      child: Text(widgetBabCerita[index]["isi_bab"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'PoppinsLight',
                              fontSize: 12
                          )),
                    ),
                            const SizedBox(height: 20),
                          ],
                        ),
                    ),
                  ],
                ));
          }),
    );
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        text,
        subject: sub,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  Future<void> loadDataBab() async {
    var dataURL = Uri.parse(baseURL + 'babcerita/' + c_id);
    http.Response response = await http.get(dataURL);

    if(response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        widgetBabCerita = jsonDecode(response.body);
      });
    }else{
      showAlertBabKosong();
    }
  }

  void showAlertBabKosong(){
    AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.SCALE,
        headerAnimationLoop: true,
        title: 'Data Cerita Masih Kosong',
        desc: 'Maaf data cerita yang dipilih masih kosong.',
        btnOkOnPress: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: const Color(0xFF6A2B84)
    ).show();
  }

  Future<void> hapusDataBabCerita(idBab, judulBab) async {
    var dataCerita = {'id': idBab};
    var res =
    CallApi().delDataBabCerita(dataCerita, 'babceritahapus/' + idBab, context);
  }


}
