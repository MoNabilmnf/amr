import 'package:amr/Global.dart';
import 'package:amr/Screens/Home.dart';
import 'package:amr/user/Home_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../BNBCustompain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PassCode extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PassCodeState();
  }

}
class PassCodeState extends State<PassCode>{
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  int groub = 0;
  String no1 ='';
  String no2 ='';
  String no3 ='';
  String no4 ='';
  String value;
  int password2 = 0 , phone = 0 , email= 0 , password= 0;
  //Color color1 = ;
  //Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
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
            'تم إرسال رمز تأكيد الى جوالك قم بكتابة الرمز ثم كلمة السر ',
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
          Text('كلمة المرور',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.white)),
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
                    controller: _controller,
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
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),width: MediaQuery.of(context).size.width * 0.8
              ),
            ],
          ),
          Text('تأكيد كلمة المرور',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.white)),
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
                    controller: _controller2,
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
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),width: MediaQuery.of(context).size.width * 0.8
              ),
            ],
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: () async {
              String Res = await AddCode(_pinPutController.text,_controller.text,_controller2.text);
              if(Res == 'success'){
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
  AddCode(code,new_password,new_password_confirmation) async {
    Map<String, dynamic> d ={
      "code":"$code",
      "new_password":"$new_password",
      "new_password_confirmation":"$new_password_confirmation"
    };
    String URL = (user_type == 'مشتري')?"https://amer.jit.sa/api/user/password/reset":"https://amer.jit.sa/api/vendor/password/reset";
    http.Response response = await http.post('$URL',body: json.encode(d),headers: { "Accept":"application/json",'Content-type': 'application/json',});
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