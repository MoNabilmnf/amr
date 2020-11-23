import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../BNBCustompain.dart';
import 'deliverd_details.dart';

class details_price extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return details_priceState();
  }

}
class details_priceState extends State<details_price>{
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  int groub = 0;
  Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:Container(height: double.infinity,

            width: double.infinity,decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/build.png"), fit: BoxFit.cover)),child:
        Column(children: [
          SizedBox(height: size.height*0.30,),
          Container(margin: EdgeInsets.all(size.height*0.02,),child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
            Stack(alignment:Alignment.center,children: [
              Container(
                height: size.height*0.09,
                width: size.height*0.09,
                //margin: EdgeInsets.only(top: 40, left: 40, right: 40),
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  //border: Border.all(color: Colors.black, width: 0.0),
                  borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)),
                ),
                child: Text('     '),
              ),
              Container(
                height: size.height*0.07,
                width: size.height*0.07,
                //margin: EdgeInsets.only(top: 40, left: 40, right: 40),
                decoration: new BoxDecoration(
                  color: Colors.grey[400],
                  //border: Border.all(color: Colors.black, width: 0.0),
                  borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)),
                ),
                child: Text('     '),
              ),
              Icon(Icons.favorite,color: Colors.red,size: size.height*0.045,),
            ],),
          ],),),

           Spacer(),
          Align(alignment: Alignment.bottomCenter,child: Container(
              padding: EdgeInsets.all(size.width*0.04),
              height: size.height*0.55,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width*0.05),
                  topRight: Radius.circular(size.width*0.05),
                  //bottomLeft: Radius.circular(5),
                  // bottomRight: Radius.circular(5)
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(children: [
                    Text("شقه في شمال الرياض - 4 غرف"+"   ",
                        style: new TextStyle(
                            fontSize: size.width*0.045,
                            color:  Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jana'
                        )),
                  ],),
                  Row(children: [
                    Text("35000 رس"+"   ",
                        style: new TextStyle(
                            fontSize: size.width*0.10,
                            color:  Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jana'
                        )),
                  ],),
                  Row(children: [
                    Text("شقه في عماره جديده مكونه من :",
                        style: new TextStyle(
                            fontSize: size.width*0.03,
                            color:  Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jana'
                        )),
                  ],),
                  Row(children: [
                    Text("1- ثلاث غرف نوم",
                        style: new TextStyle(
                            fontSize: size.width*0.03,
                            color:  Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jana'
                        )),
                  ],),
                  Row(children: [
                    Text("2- صالة",
                        style: new TextStyle(
                            fontSize: size.width*0.03,
                            color:  Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jana'
                        )),
                  ],),
                  Row(children: [
                    Text("3- مجلس",
                        style: new TextStyle(
                            fontSize: size.width*0.03,
                            color:  Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jana'
                        )),
                  ],),
                  Row(children: [
                    Text("مطبخ و مكيفات راكبة",
                        style: new TextStyle(
                            fontSize: size.width*0.03,
                            color:  Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jana'
                        )),
                  ],),
                  Spacer(),
                   Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(
                    onTap: (){
                      print("Container clicked");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => deliverd_details(),
                          ));
                      //Navigator.pushNamed(context, "NewOrder2");
                    },
                    child:Container(width:size.width*0.90,padding: EdgeInsets.only(left: 8,right:8,top: 8,bottom: 8),
                      decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)
                        ),
                      ),
                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [

                        Text("طلب شراء",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold),),

                        Container(
                          height: size.height*0.06,
                          width: size.height*0.06,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            ),
                          ),
                          child: Icon(Icons.shopping_cart,color: Colors.white,),
                        ),
                      ],),

                    ),),],) ,
                ],
              )),),
      ],),),),
    );
  }

}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}