import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/screens/LandingPage/landingServices.dart';
import 'package:topicos_inicio/services/FirebaseOperations.dart';

class LandingUtils with ChangeNotifier {
  final picker = ImagePicker();
  File userImage = File('');
  File get getUserImage => userImage;
  String userImageUrl = '';
  String get getUserImageUrl => userImageUrl;

  Future pickUserImage(BuildContext context, ImageSource source) async {
    final pickedUserImage = await picker.getImage(source: source);
    pickedUserImage == null
        ? print("Select Image")
        : userImage = File(pickedUserImage.path);
    print(userImage.path);

    userImage != null
        ? Provider.of<LandingServices>(context, listen: false)
            .showUserImage(context)
        : print('Image Upload Error');

    notifyListeners();
  }

  Future selectAvatarOptionsSheet(BuildContext context) async {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                  MaterialButton(
                  color: Colors.blue,
                  child: Text( 'Galeria' ,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize :18.0
                  )), // TextSty1e // Text
                  onPressed: (){
                  pickUserImage(context,ImageSource.gallery).whenComplete((){
                  Navigator.pop(context);
                  Provider.of<LandingServices>(context,listen:false).showUserImage(context);
                  });
                }),
                MaterialButton(
                  color: Colors.blue,
                  child: Text( 'Camera' ,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize :18.0
                  )), // TextSty1e // Text
                  onPressed: (){
                  pickUserImage(context,ImageSource.camera).whenComplete((){
                  Navigator.pop(context);
                  Provider.of<LandingServices>(context,listen:false).showUserImage(context);
                  });
                }) // Material Button
              ],
            )
              ],
            ),
            // Column
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.0)), // BoxDecoration
          ); // Container
        });
  }
}
