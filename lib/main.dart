// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/firebase_options.dart';
import 'package:topicos_inicio/screens/Chat/ChatHelpers.dart';
import 'package:topicos_inicio/screens/Feed/FeedHelpers.dart';
import 'package:topicos_inicio/screens/Homepage/HomapageHelpers.dart';
import 'package:topicos_inicio/screens/LandingPage/landingHelpers.dart';
import 'package:topicos_inicio/screens/LandingPage/landingServices.dart';
import 'package:topicos_inicio/screens/LandingPage/landingUtils.dart';
import 'package:topicos_inicio/screens/Profile/ProfileHelpers.dart';
import 'package:topicos_inicio/screens/splashscreen/splashScreen.dart';
import 'package:topicos_inicio/services/Authentication.dart';
import 'package:topicos_inicio/services/FirebaseOperations.dart';
import 'package:topicos_inicio/utils/UploadPost.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();



  await Firebase.initializeApp(
options: DefaultFirebaseOptions.android,
);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

@override
Widget build(BuildContext context){
  return MultiProvider(
    child:MaterialApp(
    home: Splashscreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      accentColor: Color(0xFF3cda7d),
      fontFamily: 'Poppins',
      canvasColor: Colors.black
    ),
  ),
    providers: [
      ChangeNotifierProvider(create: (_) => ChatHelpers()),
      ChangeNotifierProvider(create: (_) => FeedHelpers()),
      ChangeNotifierProvider(create: (_) => UploadPost()),
      ChangeNotifierProvider(create: (_) => ProfileHelpers()),
      ChangeNotifierProvider(create: (_) => HomepageHelpers()),
      ChangeNotifierProvider(create: (_) => LandingUtils()),
      ChangeNotifierProvider(create: (_) => FirebaseOperations()),
      ChangeNotifierProvider(create: (_) => LandingServices()),
      ChangeNotifierProvider(create: (_) => Authentication()),
      ChangeNotifierProvider(create: (_) => LandingHelpers())
    ]); 
}


}