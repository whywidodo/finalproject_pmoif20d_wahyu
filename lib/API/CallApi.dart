import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../Constant/ConstantApi.dart';
import '../HomePage.dart';
import '../Logout.dart';
import '../User.dart';

class CallApi{
  // Proses Registrasi User atau Pengguna
  Future postDataRegistrasi(data, apiUrl, BuildContext context) async{

    var datakomisi = {
      'kode_user': email_sementara,
      'komisi_cerita': "0",
      'jumlah_cerita': "0",
      'jumlah_komisi': "0",
      'status_komisi': "null",
    };

    try{
      http.Response hasilRespons = await http.post(Uri.parse(baseURL + apiUrl), body:data);
      // print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200 || hasilRespons.statusCode == 201) {
        http.Response hasilResponsKomisi = await http.post(Uri.parse(baseURL + 'komisi'), body:datakomisi);
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
        var jsonResponse = (jsonDecode(hasilRespons.body) as Map<String, dynamic>);
        var pesanUsername = "The username field must contain a unique value.";
        var pesanEmail = "The email field must contain a unique value.";
        var respUsername = jsonResponse['messages']["username"];
        var respEmail = jsonResponse['messages']["email"];
        var pesanAlert = "";

        if(pesanEmail == respEmail){
          pesanAlert = "Email sudah digunakan, silahkan gunakan email lain.";
        }else if(pesanUsername == respUsername){
          pesanAlert = "Username sudah digunakan, silahkan gunakan username lain.";
        }else{
          pesanAlert = "Silahkan periksa kelengkapan registrasi.";
        }

        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Registrasi Gagal',
          desc: pesanAlert,
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

  // Proses Tambah User ke Komisi
  Future postDataKomisi(data, apiUrl, BuildContext context) async{
    try{
      http.Response hasilRespons = await http.post(Uri.parse(baseURL + apiUrl), body:data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200 || hasilRespons.statusCode == 201) {
        return true;
      } else {
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
        ceritaDipilih = "Pilih kategori cerita";
        statusDipilih = "Pilih status cerita";
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

  // Proses Untuk Menghapus Data Cerita
  Future delDataCerita(data, apiUrl, BuildContext context) async{
    print(apiUrl);
    try{
      http.Response hasilRespons = await http.get(Uri.parse(baseURL + apiUrl));
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 201 || hasilRespons.statusCode == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Berhasil',
          desc: 'Cerita berhasil dihapus.',
          btnOkOnPress: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => User()), (route) => false);
          },
          btnOkIcon: Icons.cancel,
        ).show();
        return true;
      } else {
        return false;
      }
    } on Exception catch(e){
      print(e.toString());
    }
  }

  // Proses Merubah Data User
  Future putDataEditUser(data, apiUrl, BuildContext context) async{
    try {
      http.Response hasilRespons = await http.post(Uri.parse(baseURL + apiUrl), body: data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200 || hasilRespons.statusCode == 201) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Berhasil',
          desc: 'Silahkan login kembali.',
          btnOkOnPress: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const Logout()),
                    (route) => false);
          },
          btnOkIcon: Icons.cancel,
        ).show();
        return true;
      }else{
        return false;
      }
    } on Exception catch (e){
      print(e.toString());
    }
  }

  // Proses Merubah Data Cerita
  Future putDataEditCerita(data, apiUrl, BuildContext context) async{
    try {
      http.Response hasilRespons = await http.post(Uri.parse(baseURL + apiUrl), body: data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200 || hasilRespons.statusCode == 201) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Berhasil',
          desc: 'Cerita berhasil diubah.',
          btnOkOnPress: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => User()));
          },
          btnOkIcon: Icons.cancel,
        ).show();
        return true;
      }else{
        return false;
      }
    } on Exception catch (e){
      print(e.toString());
    }
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}