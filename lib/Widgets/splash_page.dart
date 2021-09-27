import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../Screens/Signin_Page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        home: Signin(),
        duration: 5000,
        imageSize: 100,
        imageSrc: "1.jpg",
        text: "Typer Animated Text",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
