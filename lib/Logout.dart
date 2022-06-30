import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant/ConstantApi.dart';
import 'HomePage.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {

  @override
  void initState() {
    super.initState();
    logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }

  logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("token");
      pref.remove("is_login");
      pref.remove("email");

      u_id = "";
      u_kodeuser = "";
      u_username = "";
      u_namalengkap = "";
      u_email = "";
      u_password = "";
    });

    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
  }


}
