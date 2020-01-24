import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'HomePage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer timer;
  initState() {
    super.initState();
    timer = Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Know', style: TextStyle(color: Colors.grey, fontSize: 100),),
              Text('ME', style: TextStyle(color: Colors.grey, fontSize: 200),),
              Padding(padding: EdgeInsets.all(40),),
              SpinKitWanderingCubes(color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}