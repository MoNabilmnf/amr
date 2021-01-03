import 'dart:async';
import 'dart:io';

import 'package:amr/Screens/Home.dart';
import 'package:amr/user/Home_user.dart';
import 'package:amr/user/Registration_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString('intro', '1');
    if(sharedPrefs.getString('intro') != null){
      if(sharedPrefs.getString('UserType') == "مشتري"){
        print(sharedPrefs.getString('UserType'));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home_user(),
            ));
      }else  if(sharedPrefs.getString('UserType') == "بائع"){
        print(sharedPrefs.getString('UserType'));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeAS(),
            ));
      }else{
        print(sharedPrefs.getString('UserType'));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Registration_user(),
            ));
      }


  }else{
      Navigator.pushReplacementNamed(context, "NextPage3_user");
    }

      }


}
