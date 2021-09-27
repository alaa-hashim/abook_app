// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../main.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Title of first page',
              body:
                  'Here you can write the description of the page, to explain someting...',
              image: buildImage('assets/1.jpg'),
            ),
            PageViewModel(
              title: 'Title of first page',
              body:
                  'Here you can write the description of the page, to explain someting...',
              image: buildImage('assets/2.jpg'),
            ),
            PageViewModel(
              title: 'Title of first page',
              body:
                  'Here you can write the description of the page, to explain someting...',
              image: buildImage('assets/3.jpg'),
            ),
            PageViewModel(
              title: 'Title of first page',
              body:
                  'Here you can write the description of the page, to explain someting...',
              image: buildImage('assets/4.jpg'),
            ),
          ],
          done: Text(
            'read',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onDone: () => main(),
          globalBackgroundColor: Colors.white,
          showNextButton: true,
          next: Icon(Icons.arrow_forward),
          skip: Text('skip'),
          showSkipButton: true,
        ),
      );

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );
}
