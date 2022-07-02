import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:finalproject_pmoif20d_wahyu/API/CallApi.dart';
import 'package:finalproject_pmoif20d_wahyu/EditBabCerita.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './API/CallApi.dart';

import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'User.dart';

class ListBabCerita extends StatefulWidget {
  const ListBabCerita({Key? key}) : super(key: key);

  @override
  _ListBabCeritaState createState() => _ListBabCeritaState();
}

class _ListBabCeritaState extends State<ListBabCerita> {

  List widgetBabCerita = [];
  String kategori_value = "";

  void initState() {
    super.initState();
    loadDataBab();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => User()), (route) => false);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Daftar Bab Cerita',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
      ),
      body: ListView.builder(
          itemCount: widgetBabCerita.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    border: Border.all(color: const Color(0xFF9B5DB5)),
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widgetBabCerita[index]["judul_bab"],
                        style: const TextStyle(
                            color: Color(0xFF9B5DB5),
                            fontFamily: 'PoppinsMedium',
                            fontSize: 13),
                      ),
                      Container(
                          child: Row(children: <Widget>[
                            IconButton(
                              onPressed: () {
                                bab_id = widgetBabCerita[index]["id"];
                                bab_idcerita = widgetBabCerita[index]["id_cerita"];
                                bab_judul = widgetBabCerita[index]["judul_bab"];
                                bab_isi = widgetBabCerita[index]["isi_bab"];
                                bab_user = widgetBabCerita[index]["kode_user"];
                                // // Ke layout tambah bab
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const EditBabCerita()),
                                        (route) => false);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Color(0xFF9B5DB5),
                                size: 15,
                              ),
                              tooltip: 'Tambah Bab',
                            ),

                            IconButton(
                                onPressed: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.QUESTION,
                                    headerAnimationLoop: true,
                                    animType: AnimType.SCALE,
                                    title: 'Hapus',
                                    desc: 'Apakah anda yakin akan menghapus bab ini?',
                                    buttonsTextStyle: const TextStyle(color: Colors.white),
                                    btnCancelText: "Tidak",
                                    btnOkText: "Ya",
                                    btnOkColor: const Color(0xFF6A2B84),
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {
                                      bab_id = '${widgetBabCerita[index]["id"]}';
                                      bab_judul = '${widgetBabCerita[index]["judul_bab"]}';
                                      hapusDataBabCerita(bab_id, bab_judul);
                                    },
                                  ).show();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color(0xFF9B5DB5),
                                  size: 15,
                                ),
                                tooltip: 'Hapus Cerita'),
                          ]))
                    ]));
          }),
    );
  }

  Future<void> loadDataBab() async {
    var dataURL = Uri.parse(baseURL + 'babcerita/' + c_id);
    http.Response response = await http.get(dataURL);

    if(response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        widgetBabCerita = jsonDecode(response.body);
        print(widgetBabCerita);
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
        title: 'Data Bab Masih Kosong',
        desc: 'Silahkan tambahkan bab cerita terlebih dahulu.',
        btnOkOnPress: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => User()), (route) => false);
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
