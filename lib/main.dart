import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'views/BodilyBMIScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bodily',
      theme: ThemeData(
        fontFamily: 'wakuwaku',
        primarySwatch: Colors.cyan,
        backgroundColor: Colors.white
      ),
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                BodilyCalculatorScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 170,
            ),
            Lottie.asset("assets/lottie/scale.json",
              width: 250,
              height: 250
            ),
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.normal,
                fontFamily: "pacifico",
                fontSize: 50,
              ),
              child: Text("Bodily"),
            )
          ],
        )
    );
  }
}