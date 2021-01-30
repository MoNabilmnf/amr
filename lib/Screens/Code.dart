import 'dart:io';

import 'package:amr/Global.dart';
import 'package:amr/Screens/Home.dart';
import 'package:amr/user/Home_user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../BNBCustompain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Code extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CodeState();
  }

}
class CodeState extends State<Code>{
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  int groub = 0;
  String no1 ='';
  String no2 ='';
  String no3 ='';
  String no4 ='';
  String value;
  String FCMToken = '';
  //Color color1 = colorFromHex("f6755f");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.getToken().then((token){
      print(token);
      FCMToken = token;
    });
  }
  @override
  Widget build(BuildContext context) {
    CheckInternet(context);
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child:Container(padding:EdgeInsets.all(8),height: double.infinity,
            width: double.infinity,decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BG.png"), fit: BoxFit.cover)),child:
        SingleChildScrollView(scrollDirection: Axis.vertical,child:Column(children: [
          SizedBox(height: size.height*0.10,),
          Text(
            'قم بإدخال رمز التأكيد',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'jana',
              fontSize: 28,
            ),
          ),

          Text(
            'تم إرسال رمز تأكيد الى جوالك قم بكتابة الرمز',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'jana',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        //   GestureDetector(onTap: (){
        //
        //   },child:Text(
        //     'لم تستلم رمز ؟',
        //     style: TextStyle(
        //       color: Colors.white70,
        //       fontFamily: 'jana',
        //       fontSize: 14,
        //       fontWeight: FontWeight.bold,
        //       decoration: TextDecoration.underline,
        //     ),
        //   ),
        // ),

          SizedBox(height: 20,),


          Container(

            margin: const EdgeInsets.all(30.0),
            //padding: const EdgeInsets.all(20.0),
            child: PinPut(

              fieldsCount: 4,
              eachFieldHeight: size.height*0.08,
              eachFieldWidth: size.width*0.15,
              textStyle: TextStyle(color: Colors.white),
              onSubmit: (String pin) {
                setState(() {
                  value = pin;
                  print(value);
                });
              },
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration.copyWith(
                color: Colors.white38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
                border: Border.all(
                  color: colorFromHex("f6755f"),
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: () async {
              CheckInternet(context);
              String Res = await AddCode(_pinPutController.text);
              if(Res == 'success'){
                await AddFCM();
                if(user_type == 'مشتري'){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home_user(),
                      ));
                }else{
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeAS(),
                      ));
                }

              }else{
                onBackPress(context,"$Res");
              }
              //print("Container $value");
              //Navigator.pushReplacementNamed(context, "Home");
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
                Text('تأكيد ', style: TextStyle(color: Colors.white,fontFamily: 'jana',
                    fontSize: 16,fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_back_rounded, color: Colors.white,),
              ],
            ),),
          ),

          SizedBox(height: 40,),

      ],),),),),
    );
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.white),
      color: Colors.white38,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5)
      ),
    );
  }
  Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
  AddCode(code) async {
    Map<String, dynamic> d ={
      "code":"$code"
    };
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    http.Response response = await http.post((sharedPrefs.getString('UserType') == 'مشتري')?'https://amer.jit.sa/api/user/verify':'https://amer.jit.sa/api/vendor/verify',body: json.encode(d),headers: { "Accept":"application/json",'Content-type': 'application/json',});
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if(response.statusCode == 200){
      //SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setString('token', '${responsebody['data']['token']}');
      sharedPrefs.setString('UserId', '${responsebody['data']['id']}');
      sharedPrefs.setString('UserType', '$user_type');
      return 'success';
    }else{
      return responsebody['data']['message'].toString();
    }
  }
  AddFCM() async {
    Map<String, dynamic> d ={
      "token":"$FCMToken"
    };
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.post((sharedPrefs.getString('UserType') == 'مشتري')?'https://amer.jit.sa/api/user/set-fcm-token':'https://amer.jit.sa/api/vendor/set-fcm-token',body: json.encode(d),headers: {HttpHeaders.authorizationHeader: "$token", "Accept":"application/json",'Content-type': 'application/json',});
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if(response.statusCode == 200){
      return 'success';
    }else{
      return responsebody['data']['message'].toString();
    }
  }
}