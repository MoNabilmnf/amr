import 'dart:async';
import 'dart:io';

import 'package:amr/user/image3_user.dart';
import 'package:flutter/material.dart';


class user_type extends StatefulWidget {
  @override
  user_typeState createState() => user_typeState();
}

class user_typeState extends State<user_type> with SingleTickerProviderStateMixin {

  @override
  initState() {
    super.initState();
    //splash();
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage3_user(),
                      ));
          },
            child:Container(
              height: size.height*0.08,
              width: size.width*0.30,
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('مشتري', style: TextStyle(color: Colors.white,fontFamily: 'jana',
                      fontSize: 16,fontWeight: FontWeight.bold),),
                  //Icon(Icons.arrow_back_rounded, color: Colors.white,),
                ],
              ),),
          ),

      SizedBox(height: 20,),

              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, "NextPage3");
                },
                child:Container(
                  height: size.height*0.08,
                  width: size.width*0.30,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('بائع', style: TextStyle(color: Colors.white,fontFamily: 'jana',
                          fontSize: 16,fontWeight: FontWeight.bold),),

                    ],
                  ),),
              ),


            ],),
          )
        ],
      ),
    );
  }

  void splash() async {
    await new Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, "NextPage3");
      }


}
