import 'package:flutter/material.dart';
import 'signin.dart';
import 'main.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => signIn(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 115.0,
                  child: Image.asset(
                    "assets/cursivequp.png",
                    fit: BoxFit.contain,
                  ),
                ),
                JumpingDotsProgressIndicator(
                  fontSize: 75.0,
                ),
              ]
          ),
        )
      )
    );
  }
}

