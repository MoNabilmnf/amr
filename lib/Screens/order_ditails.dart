import 'package:amr/Screens/send_your_order.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:image_stack/image_stack.dart';
import 'package:amr/BNBCustompain.dart';

import 'all_offers.dart';

class order_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return order_detailsState();
  }

}
class order_detailsState extends State<order_details>{
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Color color3 = colorFromHex("#0acb83");
  Color color4 = colorFromHex("#ececec");
  Color color5 = colorFromHex("##848484");
  Color color6 = colorFromHex("##e6faf2");
  Color color7 = colorFromHex("#242a38");

  int main = 1;
  List<String> images = ["https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg", "https://www.caa.com/sites/default/files/styles/headshot_500x500/public/speaker-headshots/ParsonsJ_headshot_web.jpg?itok=iu-I0aZJ"];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
    body: Directionality(
      textDirection: TextDirection.rtl,
      child:
      //Stack(children: [

        Container(child:SingleChildScrollView(scrollDirection: Axis.vertical,child:Container(child: Column(children: [
          Stack(children: [
            Container(height:size.height*0.20,decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22)
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 5,
              //     blurRadius: 7,
              //     offset: Offset(0, 3), // changes position of shadow
              //   ),
              // ],
            ),child:
            Container(margin: EdgeInsets.only(top: 30,right: 20,left: 20),child: Column(children: [
              Row(children: [


                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    image: DecorationImage(
                      image: NetworkImage("https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),

                Text("تفاصيل الطلب",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white,fontFamily: 'Jana'),),
                Spacer(),

                IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.white,), onPressed: (){
                  Navigator.pop(context);
                }),
              ],),
              SizedBox(height: 10,),



            ],),)
            ),
            Center(child: Container(margin: EdgeInsets.only(top: size.height*0.15,  bottom: 20),padding:EdgeInsets.all(10),
              height: size.height*0.45,
              width: size.width*0.90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
              ),
              child: Column(children: [
                // Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                //   Text("جميع الطلبات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: color1,fontFamily: 'Jana'),),
                //
                //   Text("طلبات جديدة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                //
                //   Text("الأعلى طلباً",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                // ],),
                // Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                //   Container(width: size.width*0.22,height: 4,color: color1,),
                //
                //   Container(width: size.width*0.22,height: 4,color: Colors.white,),
                //
                //   Container(width: size.width*0.22,height: 4,color: Colors.white,),
                // ],),
                Row(children: [
                  Expanded(flex:2,child: Container(
                    height: 100.0,
                    child: InkWell(
                        onTap: (){

                        },
                        child: Center(child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: color1,
                            //borderRadius: BorderRadius.all(Radius.circular(100.0)),
                            image: DecorationImage(
                              image: NetworkImage("https://scontent.fcai21-1.fna.fbcdn.net/v/t1.0-9/16143352_1887764818110304_4499373714857310891_n.jpg?_nc_cat=108&ccb=2&_nc_sid=9267fe&_nc_ohc=KmmCFIhJN4sAX-9mZlN&_nc_ht=scontent.fcai21-1.fna&oh=b9abfba896de9e72ef183e9e047ce809&oe=5FD95EC1"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          //width: 100,

                        ),)
                    ),
                  ),),
                  Expanded(flex:1,child: InkWell(
                    onTap: (){
                      //getImageFiles();
                      //getImage();
                    },
                    child: Container(margin: EdgeInsets.only(right: 1),child: DottedBorder(
                      color: color1,
                      strokeWidth: 1,
                      dashPattern: [8, 4],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(5),
                      //padding: EdgeInsets.all(6),
                      //strokeCap: StrokeCap.round,
                      child: Container(
                        // margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: color1,
                          border: Border.all(
                              width: 1,
                              style: BorderStyle.none
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          ),
                        ),
                        width: 100,
                        height: 100,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Icon(Icons.add,color: Colors.white,),
                            Text(
                              'عرض المزيد',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'jana',
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                      ),),),
                  ),),

                ],),
                SizedBox(height: size.height*0.01,),
                Container(
                  child: new Row(
                    children: <Widget>[
                      new Icon(
                        Icons.access_alarm_rounded,
                        color: Colors.grey,size: size.height*0.025,
                      ),
                      SizedBox(width: size.width*0.01,),
                      new Text("منذ 5 دقائق" + " ",
                          style: new TextStyle(
                              fontSize: size.height*0.015,
                              color:  Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jana'
                          )),

                    ],
                  ),),
                Container(
                  width: 300,
                  child: Text(
                    "أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign:TextAlign.right,
                    style: TextStyle(fontFamily: 'jana',fontSize: size.height*0.02,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    "أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign:TextAlign.right,
                    style: TextStyle(fontFamily: 'jana',color: Colors.grey,fontSize: size.height*0.015,),
                  ),
                ),
                Row(children: [
                  Row(children: [
                    Container(
                      //margin: EdgeInsets.all(5),
                      width: size.width*0.10,
                      height: size.width*0.10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width*0.02,),
                    Column(children: [
                      Row(children: [ Text(
                        'وسيم خالد',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'jana',
                          fontWeight: FontWeight.bold,
                          fontSize: size.width*0.035,
                        ),
                      ),

                      ],),
                      Row(children: [

                        SizedBox(width: size.width*0.02,),
                        Text(
                          'صاحب العرض',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'jana',
                            fontWeight: FontWeight.bold,
                            fontSize: size.width*0.03,
                          ),
                        ),
                      ],),
                    ],)
                  ],),
                  Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(
                    onTap: (){
                      print("Container clicked");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => send_your_order(),
                          ));
                      //Navigator.pushNamed(context, "NewOrder2");
                    },
                    child:Container(width:size.width*0.35,padding: EdgeInsets.only(left: 8,right:8,top: 8,bottom: 8),
                      decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)
                        ),
                      ),
                      child: Row(children: [
                        Container(
                          height: size.height*0.03,
                          width: size.height*0.03,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            ),
                          ),
                          child: Icon(Icons.account_balance_wallet,color: Colors.white,size: size.height*0.02,),
                        ),
                        SizedBox(width: size.width*0.02,),
                        Text("قدم عرضك",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold),),


                      ],),

                    ),),],) ,
                ],),

              ],),
            ),),
          ],),

          Container(
            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
            padding: EdgeInsets.all(size.width*0.03),
            height: size.height*0.11,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width*0.02),
                  topRight: Radius.circular(size.width*0.02),
                  bottomLeft: Radius.circular(size.width*0.02),
                  bottomRight: Radius.circular(size.width*0.02)
              ),
            ),child: Row(children: [


            Column(children: [
              Text("المزانية المتاحة",
                  style: new TextStyle(
                      fontSize: size.width*0.025,
                      color:  Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'jana'
                  )),
              Text("3500 \$ - 4000 \$",
                  style: new TextStyle(
                      fontSize: size.width*0.04,
                      color:  Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'jana'
                  )),
            ],),
            Spacer(),
            Column(children: [
              Text("العروض المقدمه",
                  style: new TextStyle(
                      fontSize: size.width*0.025,
                      color:  Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'jana'
                  )),
              Text("350",
                  style: new TextStyle(
                      fontSize: size.width*0.04,
                      color:  color1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'jana'
                  )),

            ],),
          ],),),
         // SizedBox(height: size.height*0.02,),
          Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: size.height*0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
              ),
              child: Column(
                children: <Widget>[

                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                GestureDetector(onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => all_offers(),
                      ));
                },child:
                    Text("جميع العروض",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: color1,fontFamily: 'Jana'),),
                  ),
                    Text("عروض جديدة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),

                    Text("الأعلى تقيماً",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                  ],),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                    Container(width: size.width*0.22,height: 4,color: color1,),

                    Container(width: size.width*0.22,height: 4,color: Colors.white,),

                    Container(width: size.width*0.22,height: 4,color: Colors.white,),
                  ],),
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: size.height*0.16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(flex: 2,child:Container(margin:EdgeInsets.only(left: 20,right: 20),child: Row(children: [
                    Row(children: [
                      Container(
                        //margin: EdgeInsets.all(5),
                        width: size.width*0.10,
                        height: size.width*0.10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width*0.02,),
                      Column(children: [
                        Row(children: [ Text(
                          'وسيم خالد',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'jana',
                            fontWeight: FontWeight.bold,
                            fontSize: size.width*0.035,
                          ),
                        ),
                          SizedBox(width: size.width*0.02,),
                          Icon(Icons.alarm_add,color: Colors.grey,size: size.width*0.03,),
                          SizedBox(width: size.width*0.005,),
                          Text(
                            'منذ 5 دقائق',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'jana',
                              fontWeight: FontWeight.bold,
                              fontSize: size.width*0.025,
                            ),
                          ),
                        ],),
                        Row(children: [
                          StarRating(
                            color: Colors.yellow,
                            starCount: 5,
                            rating: 4.0,
                            size: 14,
                          ),
                          SizedBox(width: size.width*0.02,),
                          Text(
                            '3600 \$',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'jana',
                              fontWeight: FontWeight.bold,
                              fontSize: size.width*0.035,
                            ),
                          ),
                        ],),
                      ],)
                    ],),
                    Spacer(),
                    Container(
                      width: size.width*0.075,
                      height: size.width*0.07,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),

                      ),child: Center(child:
                    Icon(Icons.chat,color: Colors.grey,size: size.width*0.05,),
                    ),
                    ),
                  ],),),),
                  SizedBox(height: size.height*0.01,),
                  Expanded(flex: 2,child: Container(
                    margin:EdgeInsets.only(left: 20,right: 20),
                    width: size.width,
                    child: Text(
                      "رفيق شخص مجتهد و أتمنى العمل معه مره أخرى دقيق السعر مناسب و محترم جداً و يستاهل و أنصح أي حد يتعامل معاه",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign:TextAlign.right,
                      style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ),),

                  //SizedBox(height: size.height*0.01,),

                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 40,right: 40),
              height: size.height*0.002,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
              ),
             ),
          Container(

              margin: EdgeInsets.only(left: 20,right: 20),
              height: size.height*0.16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(flex: 2,child:Container(margin:EdgeInsets.only(left: 20,right: 20),child: Row(children: [
                    Row(children: [
                      Container(
                        //margin: EdgeInsets.all(5),
                        width: size.width*0.10,
                        height: size.width*0.10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width*0.02,),
                      Column(children: [
                        Row(children: [ Text(
                          'وسيم خالد',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'jana',
                            fontWeight: FontWeight.bold,
                            fontSize: size.width*0.035,
                          ),
                        ),
                          SizedBox(width: size.width*0.02,),
                          Icon(Icons.alarm_add,color: Colors.grey,size: size.width*0.03,),
                          SizedBox(width: size.width*0.005,),
                          Text(
                            'منذ 5 دقائق',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'jana',
                              fontWeight: FontWeight.bold,
                              fontSize: size.width*0.025,
                            ),
                          ),
                        ],),
                        Row(children: [
                          StarRating(
                            color: Colors.yellow,
                            starCount: 5,
                            rating: 4.0,
                            size: 14,
                          ),
                          SizedBox(width: size.width*0.02,),
                          Text(
                            '3600 \$',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'jana',
                              fontWeight: FontWeight.bold,
                              fontSize: size.width*0.035,
                            ),
                          ),
                        ],),
                      ],)
                    ],),
                    Spacer(),
                    Container(
                      width: size.width*0.075,
                      height: size.width*0.07,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),

                      ),child: Center(child:
                    Icon(Icons.chat,color: Colors.grey,size: size.width*0.05,),
                    ),
                    ),
                  ],),),),
                  SizedBox(height: size.height*0.01,),
                  Expanded(flex: 2,child: Container(
                    margin:EdgeInsets.only(left: 20,right: 20),
                    width: size.width,
                    child: Text(
                      "رفيق شخص مجتهد و أتمنى العمل معه مره أخرى دقيق السعر مناسب و محترم جداً و يستاهل و أنصح أي حد يتعامل معاه",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign:TextAlign.right,
                      style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ),),

                  //SizedBox(height: size.height*0.01,),

                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: size.height*0.002,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
              ),
            ),
          ),
          Container(

              margin: EdgeInsets.only(left: 20,right: 20),
              height: size.height*0.16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(flex: 2,child:Container(margin:EdgeInsets.only(left: 20,right: 20),child: Row(children: [
                    Row(children: [
                      Container(
                        //margin: EdgeInsets.all(5),
                        width: size.width*0.10,
                        height: size.width*0.10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width*0.02,),
                      Column(children: [
                        Row(children: [ Text(
                          'وسيم خالد',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'jana',
                            fontWeight: FontWeight.bold,
                            fontSize: size.width*0.035,
                          ),
                        ),
                          SizedBox(width: size.width*0.02,),
                          Icon(Icons.alarm_add,color: Colors.grey,size: size.width*0.03,),
                          SizedBox(width: size.width*0.005,),
                          Text(
                            'منذ 5 دقائق',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'jana',
                              fontWeight: FontWeight.bold,
                              fontSize: size.width*0.025,
                            ),
                          ),
                        ],),
                        Row(children: [
                          StarRating(
                            color: Colors.yellow,
                            starCount: 5,
                            rating: 4.0,
                            size: 14,
                          ),
                          SizedBox(width: size.width*0.02,),
                          Text(
                            '3600 \$',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'jana',
                              fontWeight: FontWeight.bold,
                              fontSize: size.width*0.035,
                            ),
                          ),
                        ],),
                      ],)
                    ],),
                    Spacer(),
                    Container(
                      width: size.width*0.075,
                      height: size.width*0.07,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),

                      ),child: Center(child:
                      Icon(Icons.chat,color: Colors.grey,size: size.width*0.05,),
                    ),
                    ),
                  ],),),),
                  SizedBox(height: size.height*0.01,),
                  Expanded(flex: 2,child: Container(
                    margin:EdgeInsets.only(left: 20,right: 20),
                    width: size.width,
                    child: Text(
                      "رفيق شخص مجتهد و أتمنى العمل معه مره أخرى دقيق السعر مناسب و محترم جداً و يستاهل و أنصح أي حد يتعامل معاه",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign:TextAlign.right,
                      style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ),),

                  //SizedBox(height: size.height*0.01,),

                ],
              )),


        ],),)),),

        // Expanded(
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child:  Container(child:
        //     // Stack(children: [
        //
        //     Positioned(left: 0,bottom: 0,child: Container(width: size.width,height: 70,child: Stack(children: [
        //       CustomPaint(size: Size(size.width,70),painter: BNBCustompain(),),
        //       Center(heightFactor: 0.1,child: FloatingActionButton(onPressed: (){
        //
        //       },backgroundColor: color1,child: Icon(Icons.add,size: 35,),elevation: 0.1,),),
        //       Container(margin:EdgeInsets.only(top: 8),height:50,child:
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           new GestureDetector(
        //             onTap: (){
        //               print("Container clicked");
        //               setState(() {
        //                 Navigator.pushReplacementNamed(context, "Home");
        //                 main = 1;
        //               });
        //             },
        //             child: Container(child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: <Widget>[
        //                   Icon(Icons.home,size: 25,color: (main == 1)?color1:Colors.grey[700]),
        //                   Text("الرئيسية",style: (main == 1)?TextStyle(color: color1,fontFamily: 'Jana',fontSize: 12):TextStyle(color: Colors.grey[700],fontFamily: 'Jana',fontSize: 12),),
        //                 ]),),),
        //           new GestureDetector(
        //             onTap: (){
        //               print("Container clicked");
        //               Navigator.pushReplacementNamed(context, "discover");
        //               setState(() {
        //                 main = 2;
        //               });
        //             },
        //             child: Container(child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: <Widget>[
        //
        //                   Icon(Icons.widgets,size: 25,color: (main == 2)?color1:Colors.grey[700]),
        //                   Text("إكتشف",style: (main == 2)?TextStyle(color: color1,fontFamily: 'Jana',fontSize: 12):TextStyle(color: Colors.grey[700],fontFamily: 'Jana',fontSize: 12),),
        //                 ]),),),
        //           Container(width: size.width*0.20,),
        //
        //           new GestureDetector(
        //             onTap: (){
        //               print("Container clicked");
        //               setState(() {
        //                 Navigator.pushReplacementNamed(context, "messages");
        //                 main = 3;
        //               });
        //             },
        //             child: Container(child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: <Widget>[
        //
        //                   Icon(Icons.messenger,size: 25,color: (main == 3)?color1:Colors.grey[700]),
        //                   Text("الرسائل",style: (main == 3)?TextStyle(color: color1,fontFamily: 'Jana',fontSize: 12):TextStyle(color: Colors.grey[700],fontFamily: 'Jana',fontSize: 12),),
        //                 ]),),),
        //           new GestureDetector(
        //             onTap: (){
        //               print("Container clicked");
        //               Navigator.pushReplacementNamed(context, "settings");
        //               setState(() {
        //                 main = 4;
        //               });
        //             },
        //             child: Container(child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: <Widget>[
        //                   Icon(Icons.settings,size: 25,color: (main == 4)?color1:Colors.grey[700]),
        //                   Text("الإعدادات",style: (main == 4)?TextStyle(color: color1,fontFamily: 'Jana',fontSize: 12):TextStyle(color: Colors.grey[700],fontFamily: 'Jana',fontSize: 12),),
        //                 ]),),),
        //
        //
        //
        //         ],
        //       ),
        //       ),
        //       Align(
        //         alignment: Alignment.bottomCenter,
        //         child: Container(width: size.width*0.40,height: 4,color: Colors.white,),),
        //     ],),)),
        //       //],),
        //     ),
        //   ),),

      //],),
    ),




    );
  }

}
//262b39
//f6755f

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
