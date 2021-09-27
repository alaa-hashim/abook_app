// ignore_for_file: avoid_print, prefer_const_constructors, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:from_ui_app/Screens/home_page.dart';
class Phoneauth extends StatefulWidget {
  const Phoneauth({Key? key}) : super(key: key);

  @override
  _PhoneauthState createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  var otpController = TextEditingController();
  var numController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
late String phonenumber ;
  String verificationId = "";

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
      }
    } on FirebaseAuthException catch (e) {
      print("catch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'Enter valid number'
              ),
              controller: numController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter valid password'
              ),
              controller: otpController,
            ),
          ),

          TextButton(onPressed: () {
            fetchotp();
          }, child: const Text("Fetch OTP"),),
          TextButton(onPressed: () {
            verify();
          }, child: const Text("Send"))
        ],
      ),
    );
  }


  Future<void> verify() async {
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);

    signInWithPhoneAuthCredential(phoneAuthCredential);
  }


  Future<void> fetchotp() async {
    await auth.verifyPhoneNumber(
      phoneNumber:numController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },

      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;

      },

      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }

}

