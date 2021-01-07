import 'dart:ui';
import 'package:amr/Global.dart';
import 'package:amr/Screens/PassCode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BNBCustompain.dart';

class ForgotPass extends StatefulWidget {

  @override
  ForgotPassState createState() => ForgotPassState();
}

class ForgotPassState extends State<ForgotPass> {
  int name = 0;
  int s = 0;
  String type = 'مشتري';
  String _value2;
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
              Text("قم بإدخال رقم الجوال لإرسال رمز التأكيد", style: TextStyle(
                color: Colors.grey,
                fontFamily: 'jana',
                fontSize: 14,
                //fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: size.height*0.03,),

              Text('رقم الجوال',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color:(name == 1)?color1: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: TextField(
                        onChanged: (text) {
                          print("text $text");
                          setState(() {
                            (text.isEmpty)?name = 0:name = 1;
                            // phone = 1;
                          });
                        },
                        textAlign: TextAlign.center,
                        controller: _controller,
                        keyboardType: TextInputType.phone,
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
                  // Container(
                  //
                  //   child: TextField(
                  //     textAlign: TextAlign.center,
                  //     controller: _controller,
                  //     keyboardType: TextInputType.text,
                  //     maxLength: 50,
                  //     style: new TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: "jana",
                  //         fontStyle: FontStyle.normal,
                  //         fontSize: 14.0
                  //     ),
                  //     decoration: InputDecoration(
                  //       counterText: '',
                  //       border: InputBorder.none,
                  //       focusedBorder: InputBorder.none,
                  //       enabledBorder: InputBorder.none,
                  //       errorBorder: InputBorder.none,
                  //       disabledBorder: InputBorder.none,
                  //       hintText: 'exampile_email@domain.com',
                  //       hintStyle: TextStyle(color: Colors.black),
                  //     ),
                  //   ),width: MediaQuery.of(context).size.width * 0.8
                  // ),
                ],
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
                  // Row(children: [
                  //   Text('تسجيل ك',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                  // ],),
                  DropdownButtonHideUnderline(child:DropdownButton<String>(
                    value: _value2,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem<String>(
                        child: Text('بائع',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                        value: '1',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('مشتري',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                        value: '2',
                      ),

                    ],
                    onChanged: (String value) {
                      setState(() {
                        print("$value");
                        _value2 = value;
                        (value== '2')? s=0:s=1;
                        (value== '1')?type='بائع':type='مشتري';
                        // _isChose = true;
                      });
                    },
                    hint: Text("مشتري",textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.black,fontFamily: 'jana'),),

                  ),
                  ),
                ],),

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
                  onPressed: () async {


                      if(type == 'مشتري'){
                        String Res = await AddPhone(_controller.text,'https://amer.jit.sa/api/user/password/send-reset-code');

                        if(Res == "success"){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PassCode(),
                              ));
                        }else{
                          onBackPress(context,"$Res");
                        }
                      }else{
                        String Res = await AddPhone(_controller.text,'https://amer.jit.sa/api/vendor/password/send-reset-code');
                        if(Res == "success"){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PassCode(),
                              ));
                        }else{
                          onBackPress(context,"$Res");
                        }

                      }


                    // AddPhone(_controller.text);
                    // Navigator.pushReplacementNamed(context, "Home");
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
  AddPhone(phone,url) async {
    Map<String, dynamic> d ={
      "phone":"$phone"
    };
    http.Response response = await http.post('$url',body: json.encode(d),headers: { "Accept":"application/json",'Content-type': 'application/json',});
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if(response.statusCode == 200){
      // SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      // sharedPrefs.setString('token', '${responsebody['data']['token']}');
      // sharedPrefs.setString('UserId', '${responsebody['data']['id']}');
      return 'success';
    }else{
      return responsebody['data']['message'].toString();
    }
  }
}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}