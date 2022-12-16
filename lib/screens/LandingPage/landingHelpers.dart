import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/screens/Homepage/Homepage.dart';
import 'package:topicos_inicio/screens/LandingPage/landingServices.dart';
import 'package:topicos_inicio/services/Authentication.dart';

class LandingHelpers with ChangeNotifier {
  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login.png'))),
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

  Widget mainButtons(BuildContext context) {
    return Positioned(
        top: 630.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print('Signing with google');
                  Provider.of<Authentication>(context, listen: false)
                      .signInWithGoogle()
                      .whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Homepage(),
                            type: PageTransitionType.leftToRight));
                  });
                },
                child: Container(
                  child:
                      Icon(FontAwesomeIcons.google, color: Color(0xFF3cda7d)),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF3cda7d)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  emailAuthSheet(context);
                },
                child: Container(
                  child: Center(
                      child: RichText(
                          text: TextSpan(
                              text: "ONG's",
                              style: TextStyle(
                                  color: Color(0xFF3cda7d),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)))),
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

  emailAuthSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),
                //Provider.of<LandingServices>(context,listen: false).passwordLessSignIn(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: Color(0xFF3cda7d),
                        child: Text('Logar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Provider.of<LandingServices>(context,listen: false).logInSheet(context);
                        }),
                    MaterialButton(
                        color: Colors.red,
                        child: Text('Registrar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Provider.of<LandingServices>(context,listen: false).signInSheet(context);
                        })
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
          );
        });
  }
}
