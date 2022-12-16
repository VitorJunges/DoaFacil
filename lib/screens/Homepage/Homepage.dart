import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/screens/Chat/Chat.dart';
import 'package:topicos_inicio/screens/Feed/Feed.dart';
import 'package:topicos_inicio/screens/Homepage/HomapageHelpers.dart';
import 'package:topicos_inicio/services/FirebaseOperations.dart';
import '../Profile/Profile.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController homepageController = PageController();
  int pageIndex = 0;

  @override
  void initState(){
    Provider.of<FirebaseOperations>(context, listen:false).initUserData(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 60, 74, 1),
      body: PageView(
        controller: homepageController,
        children: [Feed(), Chat(), Profile()],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar: Provider.of<HomepageHelpers>(context, listen: false)
          .bottomNavBar(context, pageIndex, homepageController),
    );
  }
}
