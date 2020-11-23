import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  @override
  initState() {
    super.initState();
    splash();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            'images/BG.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
              Text("آمر", style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'jana',
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10,),
            CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),


            ],),
          )
        ],
      ),
    );
  }

  void splash() async {
    await new Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, "NextPage3_user");
      }


}
