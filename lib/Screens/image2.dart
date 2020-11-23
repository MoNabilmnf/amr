import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import '../BNBCustompain.dart';

class NextPage2 extends StatefulWidget {

  @override
  NextPage2State createState() => NextPage2State();
}

class NextPage2State extends State<NextPage2> {
  Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: size.height*0.05,right: size.width*0.05,left:size.width*0.05 ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/nextt.png"), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Row(children: [
              SizedBox(width: 50,),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, "Home");
                },
                child: Row(children: [
                  Text("تخطي", style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'jana',
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_back_ios_outlined,size: 12,color: Colors.black,),
                ],),
              ),

            ],),
            SizedBox(height: size.height*0.04,),
            Text("أختر العرض اللي تبغاه", style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
            ),
            Text("و تشوفه يناسبك", style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
            ),
            Text("إستقبل عرض تنافسية تقدر تختار بينهم", style: TextStyle(
                color: Colors.grey,
                fontFamily: 'jana',
                fontSize: 14,
                //fontWeight: FontWeight.bold
            ),
              ),
            SizedBox(height: size.height*0.03,),
            Container(
              width: size.width*0.50,
              height: 60.0,

              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    //side: BorderSide(color: Colors.red)
                ),
                color: color1,
                onPressed: (){
                  Navigator.pushReplacementNamed(context, "NextPage1");
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('التالي ', style: TextStyle(color: Colors.white,fontFamily: 'jana',
                      fontSize: 16,fontWeight: FontWeight.bold),),
                    Icon(Icons.arrow_back_rounded, color: Colors.white,),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height*0.04,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration:
                  new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration:
                  new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: color1,
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration:
                  new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),),

    );
  }
}