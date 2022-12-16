import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topicos_inicio/services/FirebaseOperations.dart';

class HomepageHelpers with ChangeNotifier{

Widget bottomNavBar(BuildContext context, int index, PageController pageController){
  return CustomNavigationBar(
    currentIndex: index,
    bubbleCurve: Curves.bounceIn,
    scaleCurve: Curves.decelerate,
    selectedColor: Color(0xFF3cda7d),
    unSelectedColor:Colors.white,
    strokeColor: Colors.white,
    scaleFactor: 0.5,
    iconSize: 30.0,
    onTap: (val){
    index = val;
    pageController.jumpToPage(val);
    notifyListeners();
    },
    backgroundColor: Color(0xff040307),
    items: [
      CustomNavigationBarItem(icon: Icon(EvaIcons.home)),
      CustomNavigationBarItem(icon: Icon(EvaIcons.messageCircle)),
      CustomNavigationBarItem(icon: CircleAvatar(
        radius:35.0,
        backgroundColor: Colors.white,
        //backgroundImage: NetworkImage(Provider.of<FirebaseOperations>(context,listen:false).getInitUserImage!),


      )),
    ]);
  }
}