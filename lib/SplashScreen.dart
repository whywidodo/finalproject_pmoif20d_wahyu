import 'dart:async';
import 'package:finalproject_pmoif20d_wahyu/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    splashscreenStart();
  }
  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer (duration, (){
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Image.asset(
              "assets/images/ceria256color.png",
              width: 100,
              height: 100,
            ),
            //text ceria
            Text("CERITA INDONESIA",style: TextStyle(fontFamily: 'PoppinsBlack',color: Color (0xFF6A2B84)))
          ],
        )
      ),
    );
  }
}

