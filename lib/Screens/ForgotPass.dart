import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import '../BNBCustompain.dart';

class ForgotPass extends StatefulWidget {

  @override
  ForgotPassState createState() => ForgotPassState();
}

class ForgotPassState extends State<ForgotPass> {
  final TextEditingController _controller = new TextEditingController();
  Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,

        child:Container(padding:EdgeInsets.only(top: 20,left: 20,right: 20),height: double.infinity,
          width: double.infinity,decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/forget.png"), fit: BoxFit.cover)),child:
          SingleChildScrollView(scrollDirection: Axis.vertical,child: Container(margin:EdgeInsets.only(top: size.height*0.45),child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // new Image.asset(
              //   'images/forgot.png',
              //   height: size.height*0.50,
              //   width: double.infinity,
              //   alignment: Alignment.center,
              // ),
              // SizedBox(height: size.height*0.04,),
              Text("هل نسية كلمة المرور ؟", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'jana',
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text("لا تقلقل يمكن إستعادتها", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'jana',
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text("قم بإدخال البريد الإلكتروني لإرسال رمز التأكيد", style: TextStyle(
                color: Colors.grey,
                fontFamily: 'jana',
                fontSize: 14,
                //fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: size.height*0.03,),

              Text('البريد الإلكتروني (إختياري)',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(

                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller,
                      keyboardType: TextInputType.text,
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
                        hintText: 'exampile_email@domain.com',
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
                    Navigator.pushReplacementNamed(context, "Home");
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('إرسال ', style: TextStyle(color: Colors.white,fontFamily: 'jana',
                          fontSize: 16,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_back_rounded, color: Colors.white,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height*0.03,),

            ],
          ),),),),
      ),

    );
  }
}