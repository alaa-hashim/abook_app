import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Restpassword extends StatefulWidget {
  @override
  _RestpasswordState createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  final _auth = FirebaseAuth.instance;
  String email ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.stretch,
              children: [
                Text( 'Rest password',
                  textAlign: TextAlign.center,
                  style:
                TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18.0, color: Colors.blueGrey),),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email'
                  ),
                  autofocus: true,
                  textAlign: TextAlign.center,

                ),
                FlatButton(
                  child: Text('Rest Password',
                    style: TextStyle(color: Colors.white,fontSize:15.0, fontWeight: FontWeight.bold ),),
                  color: Colors.blue,
                  onPressed: (){
                    _auth.sendPasswordResetEmail(email: email);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
      ),

      ),
    );
  }
}
