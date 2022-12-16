import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../services/Authentication.dart';
import '../LandingPage/landingPage.dart';

class ProfileHelpers with ChangeNotifier{

  Widget headerProfile(BuildContext context, DocumentSnapshot snapshot){
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200.0,
            width: 180.0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){

                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                      snapshot['userimage']
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    snapshot['username'],style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(EvaIcons.email,color: Colors.green,),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                          snapshot['useremail'],style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(width: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        height: 70.0,
                        width: 80.0,
                        child: Column(
                          children: [
                            Text('0', style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 28.0
                            ),),
                            Text('Seguidores', style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 12.0
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        height: 70.0,
                        width: 80.0,
                        child: Column(
                          children: [
                            Text('0', style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 28.0
                            ),),
                            Text('Seguindo', style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 12.0
                            ),)
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        height: 70.0,
                        width: 80.0,
                        child: Column(
                          children: [
                            Text('0', style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 28.0
                            ),),
                            Text('Posts', style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 12.0
                            ),)
                          ],
                        ),
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget divider(){
    return Center(
      child: SizedBox(
        height: 25.0,
        width: 350.0,
        child: Divider(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget middleProfile(BuildContext context, dynamic snapshot){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:0),
            child: Container(
              height: 10.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget footerProfile(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        height: MediaQuery.of(context).size.height*0.61,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0)
        ),
      ),
    );
  }


  logOutDialog(BuildContext context){
    return showDialog(context: context, builder:(context){
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text('Sair do DoeFácil?',style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          MaterialButton(child: Text('Não',style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.bold,
            fontSize: 18.0,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white
          ),),
          onPressed: (){
            Navigator.pop(context);
          }),
          MaterialButton(
            color: Colors.red,
            child: Text('Sim',style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.bold,
            fontSize: 18.0,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white
          ),),
          onPressed: () {
            Provider.of<Authentication>(context,listen: false).logOutViaEmail().whenComplete(() {
            Navigator.pushReplacement(context, PageTransition(child: LandingPage(), type: PageTransitionType.bottomToTop));
          });
          })
        ],
      );
    });
  }

}