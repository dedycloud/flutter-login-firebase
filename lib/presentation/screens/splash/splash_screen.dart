import 'dart:async';

import 'package:px/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    if (mounted) {
      Timer(Duration(milliseconds: 5000), () {
        Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcd22a),
      body: Center(
        child: Container(
           child: Image.asset(
             'assets/images/px.png',
             width: 113,
             height: 73,
           )),
      ),
    );
  }
}
