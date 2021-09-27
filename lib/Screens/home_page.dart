// ignore_for_file: await_only_futures, non_constant_identifier_names, unnecessary_import, avoid_print, prefer_const_constructors, avoid_types_as_parameter_names, unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:from_ui_app/Screens/All.dart';
import 'package:from_ui_app/Screens/checkout.dart';
import 'package:from_ui_app/Screens/detailes.dart';
import 'package:from_ui_app/Widgets/Sreachdelegate.dart';
import 'package:from_ui_app/classes/CAT.dart';
import 'package:from_ui_app/classes/Cart.dart';
import 'package:from_ui_app/classes/items.dart';
import 'package:provider/provider.dart';
import '../classes/language.dart';
import '../localization/language_constants.dart';
import '../main.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  // ignore: deprecated_member_use


  late UserCredential userCredential;
  var fbm = FirebaseMessaging.instance;



  getUser() {
  var user = FirebaseAuth.instance.currentUser;
  }

  initalMessage() async {
  var message = await FirebaseMessaging.instance.getInitialMessage();

  if (message != null) {
  Navigator.of(context).pushNamed("addnotes");
  }
  }

  requestPermssion() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  print('User granted permission');
  } else if (settings.authorizationStatus ==
  AuthorizationStatus.provisional) {
  print('User granted provisional permission');
  } else {
  print('User declined or has not accepted permission');
  }
  }

  @override
  void initState() {

  requestPermssion();
  initalMessage();
  fbm.getToken().then((token) {

  });
  FirebaseMessaging.onMessage.listen((event) {
  print(
  "===================== data Notification ==============================");
  });

  getUser();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x00f8f8ff),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff0000ff),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Sreachdelegate();
              }));
            },
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.add_shopping_cart_outlined),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Checkout();
                  }));
                },
              ),
              Consumer<Cart>(
                builder: (context, Cart, child) {
                  return Text("${Cart.count}");
                },
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                color: Colors.white70,
                height: 300,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.10,
                    childAspectRatio: 1.35,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Container(
                              height: 100,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: AssetImage(categories[index].image!),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Text(categories[index].name!),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return All(category: categories[index]);
                        }));
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Trending electronics',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff0000ff),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 2,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Detailes(item: items[index]);
                        }));
                      },
                      child: Consumer<Cart>(builder: (context, Cart, child) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffd9dad9),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Container(
                                    height: 140,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(items[index].image!),
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                                Text(items[index].name!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff0000ff),
                                    )),
                                Text(items[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff0000ff),
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                          Icons.add_shopping_cart_outlined),
                                      onPressed: () {
                                        Cart.add(items[index]);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }),
            ]),
          ),
        ],
      ),
    );
  }
}
