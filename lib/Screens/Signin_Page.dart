// ignore_for_file: file_names, unnecessary_import, use_key_in_widget_constructors, avoid_single_cascade_in_expression_statements, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_ui_app/Screens/Login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:from_ui_app/Widgets/alert.dart';
import '../Widgets/alreadyHaveAcc.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var myusername, mypassword, myemail ,  lastname;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Password is to weak"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("The account already exists for that email"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
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
                    key: formstate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 48.0,
                        ),
                        TextFormField(
                          validator: (firstname) {
                            if (firstname == null || firstname.isEmpty) {
                              return 'Please enter first name';
                            }
                            if (firstname.length < 2) {
                              return '  first name cant be less then 2 letters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onSaved: (value) {
                            myusername = value;
                          },
                          decoration: InputDecoration(
                            hintText: ' Please Enter your first name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          validator: (lastname) {
                            if (lastname == null || lastname.isEmpty) {
                              return 'Please enter lastname';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onSaved: (value) {
                            lastname = value;
                          },
                          decoration: InputDecoration(
                            hintText: ' Please Enter your last name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please Enter your email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onSaved: (value) {
                            myemail = value;
                          },
                          decoration: InputDecoration(
                            hintText: ' Please Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (password) {
                            if (password!.length < 2 || password.isEmpty) {
                              return 'password cant be less then 2 letters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          autofocus: true,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onSaved: (value) {
                            mypassword = value;
                          },
                          decoration: InputDecoration(
                            hintText: ' Please Enter your password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 12.0,
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
                                 UserCredential response = await signUp();
                                  if (response != null) {
                                  await FirebaseFirestore.instance
                                  .collection("users")
                                   .add({"username": myusername, "lastname":lastname,"email": myemail});
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Login();
                                      },
                                    ),
                                  );
                                }
                              },
                              minWidth: 200.0,
                              height: 42.0,
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AlreadyHaveAnAccountCheck(
                            login: false,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Login();
                                  },
                                ),
                              );
                            }),
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
