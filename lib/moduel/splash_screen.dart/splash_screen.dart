import 'dart:async';

import 'package:clubs/componant/const.dart';
import 'package:clubs/moduel/home/home.dart';
import 'package:clubs/moduel/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => uid==null?Login():Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color.fromARGB(255, 150, 202, 202),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'images/lab.png',
              height: 120,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}