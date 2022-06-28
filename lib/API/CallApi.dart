import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../Constant/ConstantApi.dart';
import '../HomePage.dart';
import '../User.dart';

class CallApi{
  Future postDataRegistrasi(data, apiUrl, BuildContext context) async{
    try{
      http.Response hasilRespons = await http.post(Uri.parse(baseURL + apiUrl), body:data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200 || hasilRespons.statusCode == 201) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Registrasi Berhasil',
          desc: 'Silahkan melakukan login untuk masuk.',
          btnOkOnPress: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
          },
          btnOkIcon: Icons.cancel,
        ).show();

        return true;
      } else {
        // var jsonResponse = (jsonDecode(hasilRespons.body) as Map<String, dynamic>);
        // print(jsonResponse['messages']["username"]);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Registrasi Gagal',
          desc: 'Silahkan periksa isian registrasi.',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red
        ).show();
        return false;
      }
    } on Exception catch(e){
      print(e.toString());
    }
  }
  Future postDataTambahCerita (data, apiUrl, BuildContext context) async{
    try{
      http.Response hasilRespons = await http.post(Uri.parse(baseURL + apiUrl), body:data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200 || hasilRespons.statusCode == 201) {
        ceritaDipilih = "Pilih Kategori Cerita";
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Tambah Cerita Berhasil',
          desc: 'Terimakasih telah berkontribusi',
          btnOkOnPress: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => User()), (route) => false);
          },
          btnOkIcon: Icons.cancel,
        ).show();

        return true;
      } else {
        // var jsonResponse = (jsonDecode(hasilRespons.body) as Map<String, dynamic>);
        // print(jsonResponse['messages']["username"]);
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Tambah Cerita Gagal',
            desc: 'Silahkan periksa kelengkapan cerita',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red
        ).show();
        return false;
      }
    } on Exception catch(e){
      print(e.toString());
    }
  }
}