//@dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/screens/LandingPage/landingUtils.dart';
import 'package:topicos_inicio/services/Authentication.dart';

class FirebaseOperations with ChangeNotifier {
  UploadTask imageUploadTask;
  String initUserEmail ,initUserName ,initUserImage;
  String get getInitUserName => initUserName;
  String get getInitUserEmail => initUserEmail;
  String get getInitUserImage => initUserImage;


  Future uploadUserAvatar(BuildContext context) async {
    Reference imageReference = FirebaseStorage.instance.ref().child(
        'userProfileAvatar/${Provider.of<LandingUtils>(context, listen: false).getUserImage.path}/${TimeOfDay.now()}');
  imageUploadTask = imageReference.putFile(Provider.of<LandingUtils>(context,listen:false).getUserImage);
  await imageUploadTask.whenComplete((){
    print('Imagem atualizada!');
  });
  imageReference.getDownloadURL().then((url) {
    Provider.of<LandingUtils>(context,listen:false).userImageUrl = url.toString();
    print('Url da imagem => ${Provider.of<LandingUtils>(context,listen:false).userImageUrl}');
    notifyListeners();
  });
  }

  Future createUserCollection(BuildContext context,dynamic data) async{
    return FirebaseFirestore.instance.collection('users').doc(Provider.of<Authentication>(context,listen:false).getUserUid).set(data);
  }


  Future initUserData(BuildContext context) async{
    return FirebaseFirestore.instance.collection('users').doc(
      Provider.of<Authentication>(context,listen: false).getUserUid
    ).get().then((doc) {
      print(doc.data());
      initUserName = doc.data()['username'];
      initUserEmail = doc.data()['useremail'];
      initUserImage = doc.data()['userimage'];
      notifyListeners();
    });
  }

  Future uploadPostData(String postId, dynamic data) async{
    return FirebaseFirestore.instance.collection('posts').doc(
      postId
    ).set(data);
  }

  Future submitChatroomData(String chatRoomName,dynamic chatRoomData) async{
    return FirebaseFirestore.instance.collection('chatrooms').doc(chatRoomName).set(chatRoomData);
  }

}
