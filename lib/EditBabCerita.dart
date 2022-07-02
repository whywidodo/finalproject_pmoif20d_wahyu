import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:finalproject_pmoif20d_wahyu/API/CallApi.dart';
import 'package:finalproject_pmoif20d_wahyu/ListBabCerita.dart';
import 'package:flutter/material.dart';

import 'Constant/ConstantApi.dart';
import 'User.dart';

class EditBabCerita extends StatefulWidget {
  const EditBabCerita({Key? key}) : super(key: key);

  @override
  _EditBabCeritaState createState() => _EditBabCeritaState();
}

class _EditBabCeritaState extends State<EditBabCerita> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController txtEditJudulBab = new TextEditingController();
  TextEditingController txtEditIsiBab = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(c_id);
    print(u_email);
    txtEditJudulBab.text = bab_judul;
    txtEditIsiBab.text = bab_isi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const ListBabCerita()),
                  (route) => false);
        },
      ),
      centerTitle: true,
      title: const Text(
        'Edit Bab Cerita',
        style: TextStyle(fontFamily: 'PoppinsMedium'),
      ),
      backgroundColor: const Color(0xFF6A2B84),
    ),
        body: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Form(
              key: _formKey,
              child: ListView(children: [
                Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Judul BAB',
                            style: TextStyle(
                                color: Color(0xFF6A2B84),
                                fontFamily: 'PoppinsMedium',
                                fontSize: 12),
                          ),
                          TextFormField(
                              controller: txtEditJudulBab,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'BAB 1',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))
                        ])),
                Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Isi BAB',
                            style: TextStyle(
                                color: Color(0xFF6A2B84),
                                fontFamily: 'PoppinsMedium',
                                fontSize: 12),
                          ),
                          TextFormField(
                              controller: txtEditIsiBab,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              minLines: null,
                              maxLines: 15,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Tuliskan isi BAB cerita',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF6A2B84), width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0xFF6A2B84)),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.black54))
                        ])),
                Container(
                    margin: const EdgeInsets.all(25),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF6A2B84),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              _validateProses();
                              // Navigator.pop(context);
                            },
                            child: const Text("Simpan",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'PoppinsMedium',
                                  color: Color(0xffffffff),
                                ))),
                      )
                    ]))
              ]),
            )));
  }
    void _validateProses() {
      if (txtEditJudulBab.text != null && txtEditIsiBab.text != null){
          lakukanProses(c_id, txtEditJudulBab.text, txtEditIsiBab.text, u_email);
      }else{
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Perubahan gagal',
            desc: 'Silahkan lengkapi isian yang diperlukan',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red
        ).show();
      }
    }

    lakukanProses(idcerita, judulbab, isibab, email) async {
      var data = {
        "id_cerita": idcerita,
        "judul_bab": judulbab,
        "isi_bab": isibab,
        "kode_user": email,
      };
      print(data);
      print(bab_id);
      bool res = await CallApi().putDataEditBab(data, 'babceritaedit/$bab_id', context);
    }
}
