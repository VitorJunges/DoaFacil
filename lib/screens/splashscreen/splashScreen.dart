import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topicos_inicio/screens/LandingPage/landingPage.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 2),()=> Navigator.pushReplacement(context, PageTransition(child: LandingPage(), type: PageTransitionType.leftToRight))
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
      body: Center(child: Container(decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/login.png')))
            )),
        );
  }
}

