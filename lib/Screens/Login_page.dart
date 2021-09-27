import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:from_ui_app/Screens/Nav-bar.dart';
import 'package:from_ui_app/Screens/Signin_Page.dart';
import 'package:from_ui_app/Screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../Widgets/Rest_password.dart';
import '../Widgets/alreadyHaveAcc.dart';





class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();


  final _auth = FirebaseAuth.instance;


  String email;
  String password ;
  bool showspinner = false ;



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor:  Color(0xff0000ff),
        body: ModalProgressHUD(
          inAsyncCall: showspinner,
          child: Column(
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
                      child: Text(
                        'Welcome back!',
                        style:GoogleFonts.lato(textStyle : TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                        ),)
                      ),
                    ),
                    SizedBox(height: 20.0,)
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
                    child:   SingleChildScrollView(
                      child:   Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 48.0,
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
                            onChanged: (value) {//Do something with the user input.
                                email = value ;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                               contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              validator: (password) {
                                if (password.length > 7 || password.isEmpty) {
                                  return 'Please Enter your password';
                                }
                                return null;
                              },
                              autofocus: true,
                              textAlign: TextAlign.center,
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                                //Do something wih the user input.
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your password.',
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
                                  child: Text('Froget Password ?',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                                  textColor: Color(0xffffdf00),
                                  onPressed: (){

                                    showModalBottomSheet(context: context, builder: ( context)=>Restpassword());
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Material(
                                color:Color(0xff0000ff),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                elevation: 5.0,
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                                    }

                                    try {
                                    final user = _auth.signInWithEmailAndPassword(email: email, password: password);
                                    if (user != null){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Navr ();
                                          },
                                        ),
                                      );

                                    }
                                    }
                                    catch (e){
                                      print (e);
                                    }//Implement login functionality.
                                  },
                                  minWidth: 200.0,
                                  height: 42.0,
                                  child: Text(
                                    'Log In',style: GoogleFonts.cairo(textStyle:TextStyle(color: Colors.white,
                                  fontSize: 18),),
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
        ),
      );

  }
}


