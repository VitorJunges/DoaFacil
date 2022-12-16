//@dart=2.9


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/services/Authentication.dart';

class FeedHelpers with ChangeNotifier {
  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_enhance_rounded,
              color: Color(0xFF3cda7d),
            ))
      ],
      title: RichText(
        text: TextSpan(
            text: 'Doe ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Fácil',
                style: TextStyle(
                  color: Color(0xFF3cda7d),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )
            ]),
      ),
    );
  }

  Widget feedBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(
                    height: 500,
                    width: 400,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return loadPosts(context, snapshot);
              }
            },
          ),
          height: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 8, 8, 8).withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0))),
        ),
      ),
    );
  }

  Widget loadPosts(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView(
        children: snapshot.data.docs.map((dynamic documentSnapshot) {
      return Container(
        
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0,left:8.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20.0,
                      backgroundImage:
                          NetworkImage(documentSnapshot.data()['userimage']),
                    ),
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,children: [
Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              documentSnapshot.data()['caption'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, left: 8),
                    child: Container(
                      
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: RichText(
                              text: TextSpan(
                                  text: documentSnapshot.data()['username'],
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' , há 12 horas',
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(0.75)))
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  ],)
                  
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                child: Image.network(
                  documentSnapshot.data()['postimage'],
                  scale: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 27,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          GestureDetector(
                            child: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 27,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:35.0),
                            child: GestureDetector(
                              child: Icon(
                                FontAwesomeIcons.comment,
                                color: Color(0xFF3cda7d),
                                size: 22,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
            Provider.of<Authentication>(context, listen: false).getUserUid ==
                      documentSnapshot.data()['useruid']
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        EvaIcons.moreVertical,
                        color: Colors.white,
                      ))
                  : Container(
                      width: 0,
                      height: 0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList());
  }
}
