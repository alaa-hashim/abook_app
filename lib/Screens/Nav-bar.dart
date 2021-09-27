// ignore_for_file: file_names, unnecessary_const

import 'package:from_ui_app/Screens/home_page.dart';
import 'package:from_ui_app/Screens/myaccount_page.dart';
import 'checkout.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class Navr extends StatefulWidget {
  const Navr({Key? key}) : super(key: key);

  @override
  _NavrState createState() => _NavrState();
}

class _NavrState extends State<Navr> {
  int pageindex = 0;
  List<Widget> pagelist = <Widget>[const Homepage(), Checkout(), Accountpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primayAnimation, secondryAnimation) =>
            FadeThroughTransition(
          animation: primayAnimation,
          secondaryAnimation: secondryAnimation,
          child: child,
        ),
        child: pagelist[pageindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff89cff0),
        currentIndex: pageindex,
        selectedIconTheme: const IconThemeData(color: Color(0xff0000ff)),
        selectedItemColor: Colors.black,
        selectedFontSize: 15,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        onTap: (value) {
          setState(() {
            pageindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cART',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'my account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'home',
          ),
        ],
      ),
    );
  }
}
