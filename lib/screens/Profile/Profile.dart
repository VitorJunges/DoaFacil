import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/screens/Profile/ProfileHelpers.dart';
import 'package:topicos_inicio/services/Authentication.dart';

import '../LandingPage/landingPage.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 8, 8).withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){

          }, 
          icon: Icon(EvaIcons.settings2Outline,color: Color(0xFF3cda7d),),
        ),
        actions: [
          IconButton(onPressed:(
          ){
            Provider.of<ProfileHelpers>(context, listen: false).logOutDialog(context);
          }, icon: Icon(EvaIcons.logOutOutline, color: Colors.red ))
        ],
        title: RichText(
          text: TextSpan(
            text: 'Meu ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Perfil',
                style: TextStyle(
                  color: Color(0xFF3cda7d),
                  fontWeight: FontWeight.bold,
                  fontSize:20.0,
                ),
              )
            ]
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('users').doc(
                Provider.of<Authentication>(context, listen:false).getUserUid
              ).snapshots(),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return new Column(
                    children: [
                      Provider.of<ProfileHelpers>(context, listen: false).headerProfile(context,snapshot.data!),
                      Provider.of<ProfileHelpers>(context, listen: false).divider(),
                      Provider.of<ProfileHelpers>(context, listen: false).middleProfile(context,snapshot),
                      Provider.of<ProfileHelpers>(context, listen: false).footerProfile(context)
                    ],
                  );
                }
              },
              ),
            ),
        ),
        ),
      );
  }
}