import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Constant/ConstantApi.dart';

class CallApi{
  Future postData(data, apiUrl, BuildContext context) async{
    try{
      http.Response hasilRespons = await http.post(Uri.parse(baseURL + apiUrl), body:data);
      print(hasilRespons.statusCode);
      print(hasilRespons.body);
      if (hasilRespons.statusCode == 200 || hasilRespons.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registrasi berhasil"))
        );
        return true;
      } else {
        return false;
      }
    } on Exception catch(e){
      print(e.toString());
    }
  }
}