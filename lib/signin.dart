import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'testinghome.dart';

class signIn extends StatefulWidget {
  signIn({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

//    final emailField = TextFormField(
//      validator: (input)
//    {
//      if(input.isEmpty)
//        {
//          return 'Please type a valid Email';
//        }
//    },
//      onSaved:(input) => _email = input,
//      style: new TextStyle(color: Colors.black),
//      obscureText: false,
//      decoration: InputDecoration(
//          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//          hintText: "Email",
//          border:
//          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//    );
//    final passwordField = TextFormField(
//      validator: (input)
//      {
//        if(input.length < 6)
//        {
//          return 'Password needs to be shorter than 6 characters';
//        }
//      },
//      onSaved:(input) => _password = input,
//      style: new TextStyle(color: Colors.black),
//      obscureText: true,
//      decoration: InputDecoration(
//          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//          hintText: "Password",
//          border:
//          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//    );
//    final loginButon = Material(
//      elevation: 5.0,
//      borderRadius: BorderRadius.circular(5.0),
//      color: Color(0xff01A0C7),
//      child: MaterialButton(
//        minWidth: MediaQuery.of(context).size.width,
//        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//        onPressed: signIn,
//        child: Text("Log In",
//            textAlign: TextAlign.center,
//            style: style.copyWith(
//                color: Colors.white, fontWeight: FontWeight.bold)),
//      ),
//    );

    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Form(
            //TODO: Implement key
            key: _formKey,
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //TODO Implement fields
                        SizedBox(
                          height: 115,
                          child: Image.asset(
                            "assets/cursivequp.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        TextFormField(
                            validator: (input)
                            {
                              if(input.isEmpty)
                              {
                                return 'Please type a valid Email';
                              }
                            },
                            onSaved:(input) => _email = input,
                            style: new TextStyle(color: Colors.black),
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Email",
                                border:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(height: 25.0),
                        TextFormField(
                          validator: (input)
                          {
                            if(input.length < 6)
                            {
                              return 'Password needs to be shorter than 6 characters';
                            }
                          },
                          onSaved:(input) => _password = input,
                          style: new TextStyle(color: Colors.black),
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Password",
                              border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(height: 35.0),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff01A0C7),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: signIn,
                            child: Text("Log In",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 150.0),
                      ],
                    ),
                  ),
                ),
              )
          ),

      ),
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate())
      {
        //TODO: login to firebase
        formState.save();
        try
        {
          FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
          //TODO: Navigate home
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          print('Signed in: ${user.uid}');
        }
        catch(e)
        {
          print('Error: $e');
        }

      }
  }
}
//title: new Image.asset('assets/title.png', fit: BoxFit.cover)