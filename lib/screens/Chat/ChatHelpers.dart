//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/services/Authentication.dart';
import 'package:topicos_inicio/services/FirebaseOperations.dart';

class ChatHelpers with ChangeNotifier{
  final TextEditingController chatroomNameController = TextEditingController();
  String chatroomAvatarUrl = 'https://www.creativefabrica.com/wp-content/uploads/2019/04/Chat-icon-by-ahlangraphic-39-580x386.jpg';
  String chatroomId;
  String get getChatroomId => chatroomId;
  
  showCreateChatroomSheet(BuildContext context){
    return showModalBottomSheet(isScrollControlled: true,context: context, builder: (context){
      return Padding(
        padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Divider(
                  color: Colors.white,
                  thickness: 4,
                ),
              ),
             
                     
                    
                  
                
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      controller: chatroomNameController,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nome da sala...',
                        hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      ),
                    ),
                  ),
                  FloatingActionButton(backgroundColor: Colors.black,
                  child: Icon(FontAwesomeIcons.plus,color: Color(0xFF3cda7d)),onPressed: ()async{
                    Provider.of<FirebaseOperations>(context,listen: false).submitChatroomData(chatroomNameController.text, {
                      'roomavatar':chatroomAvatarUrl,
                      'time':Timestamp.now(),
                      'roomname':chatroomNameController.text,
                      'username':Provider.of<FirebaseOperations>(context,listen: false).getInitUserName,
                      'useremail':Provider.of<FirebaseOperations>(context,listen: false).getInitUserEmail,
                      'userimage':Provider.of<FirebaseOperations>(context,listen: false).getInitUserImage,
                      'useruid':Provider.of<Authentication>(context,listen: false).getUserUid,
                    }).whenComplete(() {
                      Navigator.pop(context);
                    });
                  })
                ],
              )
            ],
          ),
          height: MediaQuery.of(context).size.height* 0.25,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
          ),
        ),
      );
    });
  }

  showChatRooms(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chatrooms').snapshots(),
      
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return new ListView(
            children:snapshot.data.docs.map((dynamic documentSnapshot){
              return ListTile(
                title: Text(documentSnapshot.data()['roomname'],style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
                trailing: Text('2 horas atras',style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,

                ),),
                subtitle: Text('Ultima mensagem',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: documentSnapshot.data()['roomavatar'],
                ),
              );
            }).toList());
        }
      }));
  }
}