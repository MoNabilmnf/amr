import 'dart:ui';

import 'package:amr/Screens/ForgotPass.dart';
import 'package:amr/Screens/Home.dart';
import 'package:amr/user/ForgotPass_user.dart';
import 'package:amr/user/Home_user.dart';
import 'package:amr/user/Registration_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import '../BNBCustompain.dart';
import '../Global.dart';

class Login_user extends StatefulWidget {

  @override
  Login_userState createState() => Login_userState();
}

class Login_userState extends State<Login_user> {
  String _value4,_value3,_value2,_value1;
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final TextEditingController _controller3 = new TextEditingController();
  final TextEditingController _controller4 = new TextEditingController();
  Color color1 = colorFromHex("f6755f");
  int password=0,phone=0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:Container(width:double.infinity,child:
        SingleChildScrollView(scrollDirection: Axis.vertical,child: Container( width: MediaQuery
            .of(context)
            .size
            .width,child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            new Image.asset(
              'images/loginn.png',
              //height: size.height*0.50,
              fit: BoxFit.fill,
              width: size.width,
              alignment: Alignment.center,
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                image: DecorationImage(
                  image: NetworkImage("https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height*0.03,),
            // SizedBox(height: size.height*0.04,),
            Text("أهلا بعودتك", style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
            ),
            Text("قم بتسجيل الدخول", style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
            ),



            SizedBox(height: size.height*0.03,),

            Text('رقم الهاتف',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: (phone == 1)?color1:Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                    child: TextField(
                      onChanged: (text) {
                        print("text $text");
                        setState(() {
                          (text.isEmpty)?phone = 0:phone = 1;
                          // phone = 1;
                        });
                      },
                      textAlign: TextAlign.center,
                      controller: _controller2,
                      keyboardType: TextInputType.number,
                      maxLength: 50,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "jana",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: '+201003578367',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),width: MediaQuery.of(context).size.width * 0.8
                ),
              ],
            ),

            Text('كلمة المرور',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: (password == 1)?color1:Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                    child: TextField(
                      onChanged: (text) {
                        print("text $text");
                        setState(() {
                          (text.isEmpty)?password = 0:password = 1;
                          // phone = 1;
                        });
                      },
                      textAlign: TextAlign.center,
                      controller: _controller4,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      maxLength: 50,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "jana",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: '********************',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),width: MediaQuery.of(context).size.width * 0.8
                ),
              ],
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
                  (user_type == 'مشتري')?
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home_user(),
                      )):Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeAS(),
                      ));
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('الدخول ', style: TextStyle(color: Colors.white,fontFamily: 'jana',
                        fontSize: 16,fontWeight: FontWeight.bold),),
                    Icon(Icons.arrow_back_rounded, color: Colors.white,),

                  ],
                ),
              ),
            ),
            SizedBox(height: size.height*0.05,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(child: GestureDetector(onTap: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Registration_user(),
                    ));
                print("login");
              },child: Column(children: [
                Row(children: [
                  Text("ليس لديك حساب ؟ قم", style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'jana',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //decoration: TextDecoration.underline,
                  ),),
                  Text(" بإنشاء حساب جديد", style: TextStyle(
                    color: color1,
                    fontFamily: 'jana',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //decoration: TextDecoration.underline,
                  ),),

                ],),
                Text("بكل سهوله", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'jana',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  //decoration: TextDecoration.underline,
                ),),

              ],),


              ),),
            ],),


            SizedBox(height: size.height*0.05,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(child: GestureDetector(onTap: (){
                (user_type == 'مشتري')?
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPass_user(),
                    )):Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPass(),
                    ));

                print("login");
              },child: Row(children: [
                Text("هل", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'jana',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  //decoration: TextDecoration.underline,
                ),),
                Text(" نسيت كلمة المرور ", style: TextStyle(
                  color: color1,
                  fontFamily: 'jana',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  //decoration: TextDecoration.underline,
                ),),
                Text("؟", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'jana',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  //decoration: TextDecoration.underline,
                ),),
              ],),


              ),),
            ],),

            SizedBox(height: size.height*0.05,),

          ],
        ),),),),
      ),

    );
  }
}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}