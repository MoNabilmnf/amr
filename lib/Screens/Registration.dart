import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import '../BNBCustompain.dart';

class Registration extends StatefulWidget {

  @override
  RegistrationState createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  String _value4,_value3,_value2,_value1;
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final TextEditingController _controller3 = new TextEditingController();
  final TextEditingController _controller4 = new TextEditingController();
  Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,

        child:Container(child:
          SingleChildScrollView(scrollDirection: Axis.vertical,child: Container(width: MediaQuery
              .of(context)
              .size
              .width,child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/loginn.png',
                //height: size.height*0.50,
                fit: BoxFit.fill,
                width: size.width,
                alignment: Alignment.center,
              ),
              // SizedBox(height: size.height*0.04,),
              Text("ليس لديك حساب ؟", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'jana',
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text("أنشئ حسابك بسهولة", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'jana',
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: size.height*0.03,),
              Container(
                margin: EdgeInsets.all(5),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  image: DecorationImage(
                    image: NetworkImage("https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: size.height*0.03,),
              Text('الإسم بالكامل',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: color1)),
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
                          hintText: 'سعود أحمد الهلالي',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),width: MediaQuery.of(context).size.width * 0.8
                  ),
                ],
              ),
              Text('رقم الهاتف',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(

                      child: TextField(
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
              Text('البريد الإلكتروني (إختياري)',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(

                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller3,
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
              Text('كلمة المرور',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(

                      child: TextField(
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
              Container(margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
                  decoration: BoxDecoration(
                    //color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),
                  child: Column(children: [
                    Row(children: [
                      Text('أختر المدينة',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                    ],),
                    DropdownButtonHideUnderline(child:DropdownButton<String>(
                      value: _value1,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('قطن',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '1',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '2',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '3',
                        ),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          print("$value");
                          _value1 = value;
                          // _isChose = true;
                        });
                      },
                      hint: Text("الرياض",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontFamily: 'jana'),),

                    ),
                    ),
                  ],),

                ),
                Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
                  decoration: BoxDecoration(
                    //color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),
                  child: Column(children: [
                    Row(children: [
                      Text('تسجيل ك',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                    ],),
                    DropdownButtonHideUnderline(child:DropdownButton<String>(
                      value: _value2,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('بائع',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '1',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('مكتب',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '2',
                        ),

                      ],
                      onChanged: (String value) {
                        setState(() {
                          print("$value");
                          _value2 = value;
                          // _isChose = true;
                        });
                      },
                      hint: Text("بائع",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontFamily: 'jana'),),

                    ),
                    ),
                  ],),

                ),
              ],),),
              Container(margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
                  decoration: BoxDecoration(
                    //color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),
                  child: Column(children: [
                    Row(children: [
                      Text('الفئه الرئيسيه',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                    ],),
                    DropdownButtonHideUnderline(child:DropdownButton<String>(
                      value: _value3,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('عقارات',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '1',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('سيارات',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '2',
                        ),
                        // DropdownMenuItem<String>(
                        //   child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                        //   value: '3',
                        // ),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          print("$value");
                          _value3= value;
                          // _isChose = true;
                        });
                      },
                      hint: Text("عقارات",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontFamily: 'jana'),),

                    ),
                    ),
                  ],),

                ),
                Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
                  decoration: BoxDecoration(
                    //color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),
                  child: Column(children: [
                    Row(children: [
                      Text('الفئة الفرعية',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                    ],),
                    DropdownButtonHideUnderline(child:DropdownButton<String>(
                      value: _value4,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('تأجير',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '1',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('شراء',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          value: '2',
                        ),

                      ],
                      onChanged: (String value) {
                        setState(() {
                          print("$value");
                          _value4 = value;
                          // _isChose = true;
                        });
                      },
                      hint: Text("تأجير",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontFamily: 'jana'),),

                    ),
                    ),
                  ],),

                ),
              ],),),

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
                    Navigator.pushReplacementNamed(context, "Code");
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('إنشاء حساب ', style: TextStyle(color: Colors.white,fontFamily: 'jana',
                          fontSize: 16,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_back_rounded, color: Colors.white,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height*0.03,),
              GestureDetector(onTap: (){
                Navigator.pushReplacementNamed(context, "Login");
                print("login");
              },child: Column(children: [
                Text("لديك حساب بالفعل ؟", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'jana',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  //decoration: TextDecoration.underline,
                ),),
                Text("قم بتسجيل دخولك الأن", style: TextStyle(
                  color: color1,
                  fontFamily: 'jana',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  //decoration: TextDecoration.underline,
                ),),
              ],),


              ),




              SizedBox(height: size.height*0.03,),

            ],
          ),),),),
      ),

    );
  }
}