import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/firebase_options.dart';
import 'package:topicos_inicio/screens/LandingPage/landingHelpers.dart';
import 'package:topicos_inicio/screens/splashscreen/splashScreen.dart';

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
      accentColor: Colors.blueGrey,
      fontFamily: 'Poppins',
      canvasColor: Colors.black
    ),
  ),
    providers: [
      ChangeNotifierProvider(create: (_) => LandingHelpers())
    ]); 
}


}