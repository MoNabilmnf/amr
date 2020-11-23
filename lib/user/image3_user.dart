import 'package:amr/user/Home_user.dart';
import 'package:amr/user/image2_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import '../BNBCustompain.dart';
import 'Registration_user.dart';

class NextPage3_user extends StatefulWidget {

  @override
  NextPage3_userState createState() => NextPage3_userState();
}

class NextPage3_userState extends State<NextPage3_user> {
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
                  image: AssetImage("images/nexttt.png"), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Row(children: [
              SizedBox(width: 50,),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registration_user(),
                      ));
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
            Text("خصص طلباتك على حسب", style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
            ),
            Text("إحتياجات بسهولة", style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
            ),
            Text("منصة آمر هي سوق خاص فيك يقتصر لإحتياجاتك", style: TextStyle(
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage2_user(),
                      ));
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
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}