// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login_page.dart';
import 'Signin_Page.dart';
import '../localization_page.dart';

class Accountpage extends StatefulWidget {
  @override
  _AccountpageState createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              const Text('Hello nice to meet you !'),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffffe6e5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const Login();
                            }),
                          );
                        },
                        child: Column(
                          children: const [
                            Icon(
                              FontAwesomeIcons.user,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text('Sign in')
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Signin();
                            }),
                          );
                        },
                        child: Column(
                          children: const [
                            Icon(
                              FontAwesomeIcons.users,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text('Sign up'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250.0, top: 25.0),
                child: Text('SETTINGS',
                    style: GoogleFonts.arsenal(
                      textStyle: const TextStyle(
                        color: Color(0xff343434),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: (context) => localization());
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffffe6e5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          FontAwesomeIcons.globe,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 100.0),
                          child: Text('Sign in'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 70.0),
                          child: Icon(
                            FontAwesomeIcons.angleRight,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 55,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      2.0,
                      2.0,
                    ), //Offset
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ]),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.userCircle,
                    color: Color(0xff0F52BA),
                    size: 30,
                  ),
                  title: Text('Profile',
                      style: GoogleFonts.arsenal(
                        textStyle: const TextStyle(
                          color: Color(0xff343434),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                height: 55,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      2.0,
                      2.0,
                    ), //Offset
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ]),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.mapMarkedAlt,
                    color: Color(0xff0F52BA),
                    size: 30,
                  ),
                  title: Text('Address',
                      style: GoogleFonts.arsenal(
                        textStyle: const TextStyle(
                          color: Color(0xff343434),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                height: 55,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      2.0,
                      2.0,
                    ), //Offset
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ]),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.userCog,
                    color: Color(0xff0F52BA),
                    size: 30,
                  ),
                  title: Text('Settings',
                      style: GoogleFonts.arsenal(
                        textStyle: const TextStyle(
                          color: Color(0xff343434),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                height: 55,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      2.0,
                      2.0,
                    ), //Offset
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ]),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.signOutAlt,
                    color: Color(0xffFF0000),
                    size: 30,
                  ),
                  title: Text('Sign out',
                      style: GoogleFonts.arsenal(
                        textStyle: const TextStyle(
                          color: Color(0xff343434),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xff1D2B53),
                    radius: 18,
                    child: Center(
                        child: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 22,
                    )),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff1a8cd8),
                    radius: 18,
                    child: Center(
                        child: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                      size: 22,
                    )),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff1D2B53),
                    radius: 18,
                    child: Center(
                        child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                      size: 22,
                    )),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff1D2B53),
                    radius: 18,
                    child: Center(
                        child: Icon(
                      FontAwesomeIcons.envelope,
                      color: Colors.white,
                      size: 22,
                    )),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff1D2B53),
                    radius: 18,
                    child: Center(
                        child: Icon(
                      FontAwesomeIcons.phoneAlt,
                      color: Colors.white,
                      size: 22,
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
