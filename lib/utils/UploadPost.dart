//@dart=2.9
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/services/Authentication.dart';
import 'package:topicos_inicio/services/FirebaseOperations.dart';
import '../screens/LandingPage/landingServices.dart';

class UploadPost with ChangeNotifier {
  TextEditingController captionController = TextEditingController();
  File uploadPostImage;
  File get getUploadPostImage => uploadPostImage;

  String uploadPostImageUrl;
  String get getUploadPostImageUrl => uploadPostImageUrl;
  final picker = ImagePicker();
  UploadTask imagePostUploadTask;

  Future pickUploadPostImage(BuildContext context, ImageSource source) async {
    final uploadPostImageVal = await picker.getImage(source: source);
    uploadPostImageVal == null
        ? print("Select Image")
        : uploadPostImage = File(uploadPostImageVal.path);
    print(uploadPostImageVal.path);

    uploadPostImage != null
        ? showPostImage(context)
        : print('Image Upload Error');

    notifyListeners();
  }

  Future uploadPostImageToFirebase() async {
    Reference imageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${uploadPostImage.path}/${TimeOfDay.now()}');

    imagePostUploadTask = imageReference.putFile(uploadPostImage);
    await imagePostUploadTask.whenComplete(() {
      print('Foto adicionado com sucesso');
    });

    await imageReference.getDownloadURL().then((imageUrl) {
      uploadPostImageUrl = imageUrl;
    });

    notifyListeners();
  }

  selectPostImageType(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        pickUploadPostImage(context, ImageSource.gallery);
                      },
                      color: Colors.blue,
                      child: Text(
                        'Galeria',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        pickUploadPostImage(context, ImageSource.camera);
                      },
                      color: Colors.blue,
                      child: Text(
                        'Camera',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  showPostImage(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60,
                  backgroundImage: FileImage(uploadPostImage),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          child: Text(
                            "Editar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          ),
                          onPressed: () {
                            selectPostImageType(context);
                          }),
                      MaterialButton(
                          color: Colors.blue,
                          child: Text(
                            "Salvar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            uploadPostImageToFirebase().whenComplete(() {
                              editPostSheet(context);
                            });
                          })
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  editPostSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 300,
                        child: Image.file(uploadPostImage,
                        fit:BoxFit.contain ,),

                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 110,
                        width: 5,
                        color: Color(0xFF3cda7d),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 120.0,
                          width: 330.0,
                          child: TextField(
                            maxLines: 5,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100)
                            ],
                            maxLength: 100,
                            controller: captionController,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'Adicione uma legenda...',
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  child: Text(
                    'Publicar',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  onPressed: () async{
                    print(getUploadPostImageUrl);
                    Provider.of<FirebaseOperations>(context,listen: false).uploadPostData(captionController.text, {
                      'postimage':getUploadPostImageUrl,
                      'caption':captionController.text,
                      'username':Provider.of<FirebaseOperations>(context,listen: false).getInitUserName,
                      'userimage':Provider.of<FirebaseOperations>(context,listen: false).getInitUserImage,
                      'useruid':Provider.of<Authentication>(context,listen: false).getUserUid,
                      'time':Timestamp.now(),
                      'useremail':Provider.of<FirebaseOperations>(context,listen: false).getInitUserEmail,
                    }).whenComplete(() {
                      Navigator.pop(context);
                    });
                  },
                  color: Color(0xFF3cda7d),
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12)),
          );
        });
  }
}
