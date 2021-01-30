import 'dart:io';

import 'package:amr/Global.dart';
import 'package:amr/Screens/ChatScreen.dart';
import 'package:amr/Screens/ChatScreenFack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../BNBCustompain.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class all_offersVendorHome extends StatefulWidget{
  all_offersVendorHome({this.selectedID});
  int selectedID;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return all_offersVendorHomeState();
  }

}
class all_offersVendorHomeState extends State<all_offersVendorHome>{
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  List Chat = new List();
  String nextpage;
  ScrollController _scrollController = ScrollController();
  List Offers = [];
  List sh = ['https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053668285faff42c99718.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053664315faff29f40e0b.jpg'];
  int page = 1;
  final TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() async {
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      String token = sharedPrefs.getString('token');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){


        if(nextpage != null){

          http.Response response = await http.get(nextpage,headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
          Map map = json.decode(response.body);
          List s = map['data']['buy_requests'];
          setState(() {
            nextpage = map['data']['nextPageUrl'];
          });

          for(int i = 0 ; i < s.length ; i++){
            Offers.add(s[i]);
          }
          // setState(() {
          //   nextpage = map['data']['data']['next_page_url'];
          // });
        }
        print("$nextpage");
        print("sdsaddsadsdasadsadad");

      }
    });
    getOffers(widget.selectedID,'all');
    print("${widget.selectedID}");
  }
  void onButtonPressedV(context,image,username,rate,description,created_at,id,status,Vid) {
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
            heightFactor: 0.35,
            child: BigListViewWidgetV(image,username,rate,description,created_at,id,status,Vid),
          );
        });
  }

  Widget BigListViewWidgetV(image,username,rate,description,created_at,id,status,Vid) {
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
          final Size size = MediaQuery.of(context).size;
          return Directionality(
            textDirection: TextDirection.rtl,
            child:Container(padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                child:  SingleChildScrollView(scrollDirection: Axis.vertical,child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
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
                                "$image"),
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
                          SizedBox(width: size.width*0.02,),
                          Icon(Icons.alarm_add,color: Colors.grey,size: size.width*0.03,),
                          SizedBox(width: size.width*0.005,),
                          Text(
                            '$created_at',
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
                            rating: double.parse("$rate"),
                            size: 14,
                          ),
                          SizedBox(width: size.width*0.02,),
                          // Text(
                          //   '$price \$',
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
                    SizedBox(height: size.width*0.02,),
                    Row(children: [
                      Text("وصف العرض",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
                    ],),
                    Container(
                      //margin:EdgeInsets.only(left: 20,right: 20),
                      width: size.width,
                      height: size.height*0.12,
                      child: Text(
                        "$description",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign:TextAlign.right,
                        style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                    ),
                    // SizedBox(height: size.width*0.02,),
                    // Row(children: [
                    //   Text("عينات لماتحتاجه",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
                    // ],),
                    // Container(
                    //   //margin:EdgeInsets.only(left: 20,right: 20),
                    //   height: size.height*0.15,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: listImage.length,
                    //     itemBuilder: (BuildContext context, int index){
                    //       return new InkWell(
                    //         onTap: (){
                    //         },
                    //         child:  Container(
                    //           // alignment: Alignment.centerRight,
                    //           // padding: EdgeInsets.all(12),
                    //           margin: EdgeInsets.only(left: 10),
                    //           decoration: BoxDecoration(
                    //             // color: Colors.white,
                    //             borderRadius: BorderRadius.only(
                    //                 topLeft: Radius.circular(10),
                    //                 topRight: Radius.circular(10),
                    //                 bottomLeft: Radius.circular(10),
                    //                 bottomRight: Radius.circular(10)
                    //             ),
                    //           ),
                    //           //width: 120,
                    //           child: Column(
                    //             children: <Widget>[
                    //               Container(
                    //                 width: size.width*0.30,
                    //                 height: size.height*0.15,
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    //                   image: DecorationImage(
                    //                     image: NetworkImage("${listImage[index]['images']}"),
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ),
                    //               ),
                    //               //Align(alignment: Alignment.topRight,child:  ),
                    //
                    //
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  //  SizedBox(height: size.width*0.02,),

                    //SizedBox(height: size.width*0.02,),

                    SizedBox(height: size.width*0.02,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      (status != "0")?Container():GestureDetector(onTap: (){
                        _onLoadingAccept(context,id);
                      },child: Row(children: [
                        Icon(Icons.assignment_turned_in_sharp,color: Colors.green,size: size.height*0.03,),
                        SizedBox(width: size.width*0.01,),
                        Text("قبول العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.width*0.04,color: Colors.green,fontFamily: 'Jana'),),
                      ],),
                      ),
                      GestureDetector(onTap: (){
                        Navigator.of(context).pop();
                        getChatStatuse(Vid,username,image);
                        //_onLoadingAccept(context,id);
                      },child: Row(children: [
                        Icon(Icons.message_rounded,color: Colors.red,size: size.height*0.03,),
                        SizedBox(width: size.width*0.01,),
                        Text("راسلني",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.width*0.04,color: Colors.red,fontFamily: 'Jana'),),
                      ],),
                      ),
                      (status != "0")?Container():GestureDetector(onTap: (){
                        _onLoadingRe(context,id);
                        //_onLoadingAccept(context,id);
                      },child: Row(children: [
                        Icon(Icons.delete_forever,color: Colors.red,size: size.height*0.03,),
                        SizedBox(width: size.width*0.01,),
                        Text("رفض العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.width*0.04,color: Colors.red,fontFamily: 'Jana'),),
                      ],),
                      ),

                    ],),
                    SizedBox(height: size.width*0.02,),
                  ],
                )),),);
        });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        // title: Center(child:Text('${widget.bill_code}'),),
        title: Center(child:Column(children: [
          Text('جميع الطلبات',style: TextStyle(
              color: Colors.black,
              fontFamily: 'jana'
              ,fontWeight: FontWeight.bold,fontSize: 14),),
          Text('${Offers.length} عرض',style: TextStyle(
              color: Colors.black,
              fontFamily: 'jana',fontSize: 10,fontWeight: FontWeight.bold
          ),),
        ],)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[

        ],
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(child: Column(children: [
          SizedBox(height: size.height*0.02,),
          Column(children: [

                Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                  GestureDetector(onTap: (){
                    setState(() {
                      page = 1;
                      Offers.clear();
                      getOffers(widget.selectedID,'all');
                    });
                  },
                  child:Text("جميع الطلبات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: (page==1)?color1:Colors.grey,fontFamily: 'Jana'),),
                  ),
                  GestureDetector(onTap: (){
                    setState(() {
                      page = 2;
                      Offers.clear();
                      getOffers(widget.selectedID,'new_offers');
                    });
                  },
                    child:Text("أحدث الطلبات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: (page==2)?color1:Colors.grey,fontFamily: 'Jana'),),
                  ),
                  GestureDetector(onTap: (){
                    setState(() {
                      page = 3;
                      Offers.clear();
                      getOffers(widget.selectedID,'old_offers');
                    });
                  },
                    child:Text("الأقدم",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: (page==3)?color1:Colors.grey,fontFamily: 'Jana'),),
                  ),
                  // GestureDetector(onTap: (){
                  //   setState(() {
                  //     page = 4;
                  //     Offers.clear();
                  //     getOffers(widget.selectedID,'less_price');
                  //   });
                  // },
                  //   child:Text("الأقل سعر",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: (page==4)?color1:Colors.grey,fontFamily: 'Jana'),),
                  // ),

                ],),
                Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                  Container(margin:EdgeInsets.only(right: 2),width: size.width*0.25,height: 4,color: (page==1)?color1:Colors.grey[100],),

                  Container(margin:EdgeInsets.only(right: 6),width: size.width*0.22,height: 4,color: (page==2)?color1:Colors.grey[100],),

                  Container(width: size.width*0.12,height: 4,color: (page==3)?color1:Colors.grey[100],),

                ],)


              ],),
          SizedBox(height: size.height*0.02,),
          (Offers.isEmpty)?Container():Expanded(child:ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: Offers.length,
            itemBuilder: (BuildContext context, int index) {
              if(Offers.length == index){
                return CupertinoActivityIndicator();
              }
              return GestureDetector(onTap:(){
                onButtonPressedV(context,Offers[index]['user']['image'],Offers[index]['user']['username'],Offers[index]['user']['rate'],
                    Offers[index]['note'],Offers[index]['created_at'],Offers[index]['id'],Offers[index]['status'],Offers[index]['user']['id']);
              },child: Card(margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: Container(

                    height: size.height*0.20,
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
                                      "${Offers[index]['user']['image']}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width*0.02,),
                            Column(children: [
                              Row(children: [ Text(
                                '${Offers[index]['user']['username']}',
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
                                  '${Offers[index]['created_at']}',
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
                                  rating: double.parse("${Offers[index]['user']['rate']}"),
                                  size: 14,
                                ),
                                SizedBox(width: size.width*0.02,),
                                // Text(
                                //   '${Offers[index]['price']} \$',
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

                            ),child: Column(children: [
                            Icon(Icons.remove_red_eye_sharp,color: Colors.grey,size: size.width*0.07,),
                          ],),
                          ),
                        ],),),),
                        SizedBox(height: size.height*0.01,),
                        Expanded(flex: 2,child: Container(
                          margin:EdgeInsets.only(left: 20,right: 20),
                          width: size.width,
                          child: Text(
                            "${Offers[index]['note']}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign:TextAlign.right,
                            style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ),),
                        SizedBox(height: size.height*0.01,),

                        Expanded(flex:1,child:Container(margin:EdgeInsets.only(right: 20,left: 20),child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          (Offers[index]['status'] != "0")?Container():GestureDetector(onTap: (){
                            _onLoadingAccept(context,Offers[index]['id']);
                          },child:  Row(children: [
                            Icon(Icons.assignment_turned_in_sharp,color: Colors.green,size: size.height*0.016,),
                            SizedBox(width: size.width*0.01,),
                            Text("قبول العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.height*0.015,color: Colors.green,fontFamily: 'Jana'),),
                          ],),
                          ),
                          GestureDetector(onTap: (){
                            getChatStatuse(Offers[index]['user']['id'],Offers[index]['user']['username'],Offers[index]['user']['image']);
                            //_onLoadingAccept(context,Offers[index]['id']);
                          },child:  Row(children: [
                            Icon(Icons.message_rounded,color: Colors.red,size: size.height*0.016,),
                            SizedBox(width: size.width*0.01,),
                            Text("راسلني",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.height*0.015,color: Colors.red,fontFamily: 'Jana'),),
                          ],),
                          ),
                          (Offers[index]['status'] != "0")?Container(): GestureDetector(onTap: (){
                            _onLoadingRe(context,Offers[index]['id']);
                          },child:  Row(children: [
                            Icon(Icons.delete_forever,color: Colors.red,size: size.height*0.016,),
                            SizedBox(width: size.width*0.01,),
                            Text("رفض العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.height*0.015,color: Colors.red,fontFamily: 'Jana'),),
                          ],),
                          ),

                        ],),),
                        )
                        //SizedBox(height: size.height*0.01,),

                      ],
                    )),));
            },
          ),)
          ],),),

      ),);
  }

  void getOffers(id,Key) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      'https://amer.jit.sa/api/vendor/offer/buy-requests/$id/$Key',
      headers: {HttpHeaders.authorizationHeader:"$token","Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      Offers = map['data']['buy_requests'];
      nextpage = map['data']['nextPageUrl'];
    });
    print(Offers);
  }
  Accept(offer_id) async {
    var d ={
      "offer_id":"${widget.selectedID}",
      "buy_request_id":"$offer_id"

    };
    print(d.toString());
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.post('https://amer.jit.sa/api/vendor/offer/accept-buy-request', body: d,
        headers: {HttpHeaders.authorizationHeader:"$token",
          "Accept": "application/json",
        });
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if (response.statusCode == 200) {
      return 'success';
    } else {
      print(response.statusCode.toString());
      return responsebody['data'].toString();
    }
  }

  reject(offer_id) async {
    var d ={
      "offer_id":"${widget.selectedID}",
      "buy_request_id":"$offer_id"

    };
    print(d.toString());
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.post('https://amer.jit.sa/api/vendor/offer/reject-buy-request', body: d,
        headers: {HttpHeaders.authorizationHeader:"$token",
          "Accept": "application/json",
        });
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if (response.statusCode == 200) {
      return 'success';
    } else {
      print(response.statusCode.toString());
      return responsebody['data'];
    }
  }
  void _onLoadingAccept(context,id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () async {
      String Res = await Accept(id);
      print(Res);
      if(Res == 'success'){
         Navigator.of(context).pop();
         Fluttertoast.showToast(
             msg: "تم القبول بنجاح",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.black,
             textColor: Colors.white,
             fontSize: 16.0
         );
         Offers.clear();
         getOffers(widget.selectedID,'new_offers');
      }else{
        onBackPress(context,Res);
      }
    });
  }
  void _onLoadingRe(context,id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () async {
      String Res = await reject(id);
      print(Res);
      if(Res == 'success'){
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: "تم الرفض بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Offers.clear();
        getOffers(widget.selectedID,'new_offers');
      }else{
        onBackPress(context,Res);
      }
    });
  }
  void getChatStatuse(id,username,image) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      'https://amer.jit.sa/api/vendor/rooms/checkExistsRoom/${id}',
      headers: {HttpHeaders.authorizationHeader: "$token","Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    if(response.statusCode == 444){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChatScreenFack(selectedID:id,Name: username,image: image,),
        ),
      );
    }else{
      print("$id $username $image");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => chatScreen(selectedID:map['data']['room_id'],),
        ),
      );
    }

  }
}