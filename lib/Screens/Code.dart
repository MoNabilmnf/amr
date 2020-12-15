import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../BNBCustompain.dart';

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
  int groub = 0;
  String no1 ='';
  String no2 ='';
  String no3 ='';
  String no4 ='';
  String value;
  Color color1 = colorFromHex("f6755f");
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
            'تم إرسال رمز تأكيد الى جوالك قم بكتابة الرمز',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'jana',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(onTap: (){

          },child:Text(
            'لم تستلم رمز ؟',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'jana',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

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
                  color: color1,
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              print("Container $value");
              Navigator.pushReplacementNamed(context, "Home");
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
}