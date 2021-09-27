
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_ui_app/Screens/Login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/alreadyHaveAcc.dart';


class Signin extends StatefulWidget {

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String firstname ;
  String lastname ;
  String email ;
  String password ;

  bool showspinner = false;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        backgroundColor:  Color(0xff0000ff),

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
          validator: (firstname) {
            if (firstname == null || firstname.isEmpty) {
              return 'Please enter first name';
            }
            return null;
          },
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              firstname = value ;
            },
            decoration: InputDecoration(
              hintText: ' Please Enter your first name',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
          onChanged: (value) {
            lastname = value ;
          },
          decoration: InputDecoration(
            hintText: ' Please Enter your last name',
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
          onChanged: (value) {
            email = value ;
          },
          decoration: InputDecoration(
            hintText: ' Please Enter your email',
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

          ),
        ),
          SizedBox(
            height: 10.0,
          ),
        TextFormField(
          validator: (password) {
            if (password.length > 7 || password.isEmpty) {
              return 'Please Enter your password';
            }
            return null;
          },
          keyboardType: TextInputType.visiblePassword,
          autofocus: true,
          obscureText:true ,
          textAlign: TextAlign.center,
          onChanged: (value) {
            password = value ;
          },
          decoration: InputDecoration(
            hintText: ' Please Enter your password',
                       contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }

                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newuser != null){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        ),
                      );
                      setState(() {
                        showspinner = false ;
                      });
                    }

                  }
                  catch (e){
                    print (e);
                  }
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Sign up',style: TextStyle(
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
            }
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
