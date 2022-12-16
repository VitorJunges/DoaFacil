import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/screens/Feed/FeedHelpers.dart';
import 'package:topicos_inicio/utils/UploadPost.dart';

class Feed extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 8, 8).withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.black,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: (){ 
            Provider.of<UploadPost>(context,listen:false).selectPostImageType(context);
           },
          icon: Icon(Icons.camera_enhance_rounded,
          color: Color(0xFF3cda7d),))
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
                  fontSize:20.0,
                ),
              )
            ]
          ),
        ),
      ),
      body: Provider.of<FeedHelpers>(context).feedBody(context),



    );
  }
}