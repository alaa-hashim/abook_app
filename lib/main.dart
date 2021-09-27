// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:from_ui_app/Screens/Nav-bar.dart';
import 'package:from_ui_app/Screens/Signin_Page.dart';
import 'package:provider/provider.dart';
import 'classes/Cart.dart';
import 'localization/demo_localization.dart';
import 'localization/language_constants.dart';
import 'Widgets/splash_page.dart';

bool? islogin;
Future backgroudMessage(RemoteMessage message) async {
  print("${message.notification!.body}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroudMessage);
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[800])),
      );
    } else {
      return ChangeNotifierProvider(
        create: (context) {
          return Cart();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _locale,
          supportedLocales: [
            Locale("en", "US"),
            Locale("fa", "IR"),
            Locale("ar", "SA"),
            Locale("hi", "IN")
          ],
          localizationsDelegates: [
            DemoLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: islogin == false ? Signin() :Navr(),
        ),
      );
    }
  }
}
