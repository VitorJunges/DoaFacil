import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/screens/Chat/ChatHelpers.dart';

class Chat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(FontAwesomeIcons.plus,color: Color(0xFF3cda7d)),
        onPressed: (){
          Provider.of<ChatHelpers>(context,listen:false).showCreateChatroomSheet(context);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(EvaIcons.moreVertical,color: Colors.white,))
        ],
        leading: IconButton(onPressed: (){
            Provider.of<ChatHelpers>(context,listen:false).showCreateChatroomSheet(context);
          }, icon: Icon(FontAwesomeIcons.plus,color: Color(0xFF3cda7d),)),
        title: RichText(
          text: TextSpan(
            
            children: <TextSpan>[
              TextSpan(
                text: 'Mensagens',
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
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Provider.of<ChatHelpers>(context,listen: false).showChatRooms(context)
      ),
    );
  }
}