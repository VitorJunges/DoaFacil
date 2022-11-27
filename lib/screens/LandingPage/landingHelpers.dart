import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingHelpers with ChangeNotifier {
  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/login.png'))),
    );
  }

  Widget taglineText(BuildContext context) {
    return Positioned(
        top: 450.0,
        left: 10.0,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 170.0,
          ),
          child: RichText(
            text: TextSpan(
                text: 'DOA ',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
                children: <TextSpan>[
                  TextSpan(
                    text: 'FÁCIL ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF3cda7d),
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                  TextSpan(
                    text: 'procure, escolha e doe',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  )
                ]),
          ),
        ));
  }

  Widget mainButtons(BuildContext context){
    return Positioned(
      top: 630.0,
      child: Container(
        width:MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
            child: Container(
              child: Icon(EvaIcons.emailOutline,color:Color(0xFF3cda7d)),
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3cda7d)),
                borderRadius: BorderRadius.circular(10)),
            ),
            ),
            GestureDetector(
            child: Container(
              child: Icon(FontAwesomeIcons.google,color:Color(0xFF3cda7d)),
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3cda7d)),
                borderRadius: BorderRadius.circular(10)),
            ),
            ),
            GestureDetector(
            child: Container(
              child: Center(child:RichText(text:TextSpan(text: "ONG's",style: TextStyle(color:Color(0xFF3cda7d),fontFamily: 'Poppins',fontWeight: FontWeight.bold,fontSize: 20)))),
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3cda7d)),
                borderRadius: BorderRadius.circular(10)),
            ),
            )
          ],
        ),
      ));
  }
}