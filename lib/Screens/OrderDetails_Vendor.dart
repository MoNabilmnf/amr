import 'dart:io';

import 'package:amr/Screens/EditOrder.dart';
import 'package:amr/Screens/send_your_order.dart';
import 'package:amr/user/UserOrder.dart';
import 'package:amr/user/UserOrderupdate.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:image_stack/image_stack.dart';
import 'package:amr/BNBCustompain.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'all_offers.dart';
import 'all_offersVendorHome.dart';

class order_details_vendor extends StatefulWidget{
  order_details_vendor({this.id});
  final int id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return order_details_vendorState();
  }

}
class order_details_vendorState extends State<order_details_vendor>{
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Color color3 = colorFromHex("#0acb83");
  Color color4 = colorFromHex("#ececec");
  Color color5 = colorFromHex("##848484");
  Color color6 = colorFromHex("##e6faf2");
  Color color7 = colorFromHex("#242a38");
  Map C ;
  List SS = [];
  List img = [];
  String username = '' , imageProfile = '';
  int main = 1;
  List<String> images = ["https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg", "https://www.caa.com/sites/default/files/styles/headshot_500x500/public/speaker-headshots/ParsonsJ_headshot_web.jpg?itok=iu-I0aZJ"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrder();
    getAPI();
  }
  ScrollController _scrollController = ScrollController();
  void onButtonPressedfloat(context) {
    showModalBottomSheet(

        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(22.0),
              topRight: const Radius.circular(22.0)),
        ),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return FractionallySizedBox(
            heightFactor: 0.90,
            child: UserOrderupdate(id: widget.id,),
            //BigListViewWidgetfloat(),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:
        //Stack(children: [

        (C == null)?Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(color1),
            )):Container(child:SingleChildScrollView(scrollDirection: Axis.vertical,child:Container(child: Column(children: [
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
                      image: NetworkImage("$imageProfile"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),

                Text("تفاصيل العرض",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white,fontFamily: 'Jana'),),
                Spacer(),

                IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.white,), onPressed: (){
                  Navigator.pop(context);
                }),
              ],),
              SizedBox(height: 10,),



            ],),)
            ),
            Center(child: Container(margin: EdgeInsets.only(top: size.height*0.15,  bottom: 20),padding:EdgeInsets.all(10),

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
                              image: NetworkImage("${C['offer']['images'][0]['images']}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          //width: 100,

                        ),)
                    ),
                  ),),
                  Expanded(flex:1,child: InkWell(
                    onTap: (){
                      onButtonPressedimages(context);
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
                      new Text("${C['offer']['created_at']}" + " ",
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
                    "${C['offer']['title']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign:TextAlign.right,
                    style: TextStyle(fontFamily: 'jana',fontSize: size.height*0.02,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    "${C['offer']['description']}",
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
                              "$imageProfile"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width*0.02,),
                    Column(children: [
                      Row(children: [ Text(
                        '$username',
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
                      //onButtonPressedfloat(context);
                      // print("Container clicked");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditOrder(id:C['offer']['id'],Images:img,title:C['offer']['title'],descrtiption:C['offer']['description'],CatId:C['offer']['category']['id'],SubCatId:C['offer']['sub_category']['id'],CityId:C['offer']['city']['id'],DisId:C['offer']['district']['id'],price:C['offer']['price'],CityName:C['offer']['city']['title'],DisName:C['offer']['district']['title'],SubCatName:C['offer']['sub_category']['title'] ,),
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
                        Text("تعديل",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold),),


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
              Text("${C['offer']['price']} \$",
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
              Text("${SS.length}",
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
                            builder: (context) => all_offersVendorHome(selectedID: C['offer']['id'],),
                          ));
                    },child:
                    Text("جميع الطلبات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: color1,fontFamily: 'Jana'),),
                    ),
                    Text("طلب جديدة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),

                    Text("الأعلى تقيماً",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                  ],),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                    Container(width: size.width*0.22,height: 4,color: color1,),

                    Container(width: size.width*0.22,height: 4,color: Colors.white,),

                    Container(width: size.width*0.22,height: 4,color: Colors.white,),
                  ],),
                ],
              )),
          (SS.isEmpty)?Container(): ListView.builder(
              shrinkWrap: true,
              //scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: SS.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
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
                                      "${SS[index]['user']['image']}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width*0.02,),
                            Column(children: [
                              Row(children: [ Text(
                                '${SS[index]['user']['username']}',
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
                                  '${SS[index]['created_at']}',
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
                                  rating: double.parse("${SS[index]['user']['rate']}"),
                                  size: 14,
                                ),
                                SizedBox(width: size.width*0.02,),
                                // Text(
                                //   '${SS[index]['price']} \$',
                                //   style: TextStyle(
                                //     color: Colors.green,
                                //     fontFamily: 'jana',
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: size.width*0.035,
                                //   ),
                                // ),
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
                            "${SS[index]['note']}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign:TextAlign.right,
                            style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ),),

                        //SizedBox(height: size.height*0.01,),

                      ],
                    ));
              }),



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
  void onButtonPressedimages(context) {
    showModalBottomSheet(

        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(22.0),
              topRight: const Radius.circular(22.0)),
        ),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child:FractionallySizedBox(
                heightFactor: 0.50,
                child:StatefulBuilder(// You need this, notice the parameters below:
                    builder: (BuildContext context, StateSetter setState) {

                      return Container(
                        height: MediaQuery.of(context).size.height*0.30,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (BuildContext context, int index) {
                            print("${img[index]['images']}");
                            return  Container(
                              height: MediaQuery.of(context).size.width*0.45,
                              width: MediaQuery.of(context).size.width*0.40,
                              margin: EdgeInsets.only(left: 10,right: 10),child: Image.network(
                              "${img[index]['images']}",
                              //color: color1,

                            ),);
                          },
                        ),
                      );
                    }),


                //BigListViewWidgetfloat(),
              ));
        });
  }
  void getOrder() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    //String T = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdmVuZG9yXC9sb2dpbiIsImlhdCI6MTYwOTQxODk2NywiZXhwIjoxNjA5Njc4MTY3LCJuYmYiOjE2MDk0MTg5NjcsImp0aSI6Ik9pbjNXMEFCZVZDb1ZDWGsiLCJzdWIiOjMsInBydiI6IjkyM2E3Mzc1YjY1NmNhNWJiOWE3MjE2MjNmZTU5ZWI1ZjQ1MWYzZTkifQ.LLnnWP0iST--uLSBoS7jmAB3Zc3LnSsHg_FkZIUIwcI';
    http.Response response = await http.get('https://amer.jit.sa/api/vendor/offer/show/${widget.id}',headers: { HttpHeaders.authorizationHeader: T,"Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    if(response.statusCode == 200){
      setState(() {
        C = map['data'];
        SS = map['data']['offer']['buy_requests'];
        img = map['data']['offer']['images'];
        //City = map['data']['cities'];
      });
    }


  }
  void getAPI() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get((sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/profile":'https://amer.jit.sa/api/vendor/profile',headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
     // Profile = map['data'];
      username = map['data']['username'];
      imageProfile = map['data']['image'];
    });

  }
}
//262b39
//f6755f

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
