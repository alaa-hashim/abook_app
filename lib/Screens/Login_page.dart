// ignore_for_file: deprecated_member_use, file_names, unnecessary_import, avoid_single_cascade_in_expression_statements, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:from_ui_app/Screens/Nav-bar.dart';
import 'package:from_ui_app/Screens/Signin_Page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/Rest_password.dart';
import '../Widgets/alreadyHaveAcc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mypassword, myemail;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: const Text("No user found for that email"))
              .show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: const Text("Wrong password provided for that user"))
              .show();
        }
      }
    } else {
      print("Not Vaild");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0000ff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Welcome back!',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formstate ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 48.0,
                        ),
                        TextFormField(
                          onSaved: (val) {
                            myemail = val;
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Email can't to be larger than 100 letter";
                            }
                            if (val.length < 2) {
                              return "Email can't to be less than 2 letter";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            //Do something with the user input.
                            myemail = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          onSaved: (val) {
                            mypassword = val;
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Password can't to be larger than 100 letter";
                            }
                            if (val.length < 4) {
                              return "Password can't to be less than 4 letter";
                            }
                            return null;
                          },
                          autofocus: true,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          onChanged: (value) {
                            mypassword = value;
                            //Do something wih the user input.
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your password.',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlatButton(
                              child: Text(
                                'Froget Password ?',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              textColor: Color(0xffffdf00),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Restpassword());
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: Color(0xff0000ff),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () async {
                                var user = await signIn();
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Navr();
                                      },
                                    ),
                                  );
                                }
                              },
                              minWidth: 200.0,
                              height: 42.0,
                              child: Text(
                                'Log In',
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Signin();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
