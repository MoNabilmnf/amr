import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import '../BNBCustompain.dart';
import '../Global.dart';
import 'deliverd_details.dart';

class details_price extends StatefulWidget{
  details_price({this.id});
  int id;
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
  Map OfferData;
  bool fav;
  Color color1 = colorFromHex("f6755f");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprofileData();
  }
  addFavorite(order_id) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    var body = {
      "offer_id":"$order_id"
    };
    http.Response response = await http.post("https://amer.jit.sa/api/user/offer/favorite",body: body,headers: {HttpHeaders.authorizationHeader:  T, "Accept":"application/json"});
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if(response.statusCode == 200){
      //onBackPress(context,'${responsebody['data']['message']}');
      return 'success';
    }else{
      // onBackPress(context,'${responsebody['data']['message']}');
      print(response.statusCode.toString());
      return '${responsebody['data']['message']}';
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:Container(height: double.infinity,
            color: Colors.white,
            width: double.infinity,child:
        Column(children: [
          Stack(children: [
            Container(height: size.height*0.50,
              width: double.infinity,decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage((OfferData==null)?"":"${OfferData['images']}"), fit: BoxFit.cover)),),

            Container(margin: EdgeInsets.only(top: size.height*0.30,left: size.height*0.02),child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
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
                (OfferData==null)?Container():InkWell(
                  onTap: () async {
                    String Res = await addFavorite(OfferData['id']);
                    if(Res != "success"){onBackPress(context,Res);
                    }else{
                      getprofileData();
                    }
                  },
                  child:Icon((OfferData['is_favorite']==false)?Icons.favorite_border:Icons.favorite,color: Colors.red,size: size.height*0.045,),),
              ],),
            ],),),
            // Spacer(),
            Container(
                margin: EdgeInsets.only(top: size.height*0.45,),
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
                      Text((OfferData==null)?"":"${OfferData['title']}",
                          style: new TextStyle(
                              fontSize: size.width*0.045,
                              color:  Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jana'
                          )),
                    ],),
                    Row(children: [
                      Text((OfferData==null)?"":"${OfferData['price']} رس"+"   ",
                          style: new TextStyle(
                              fontSize: size.width*0.10,
                              color:  Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jana'
                          )),
                    ],),
                    Row(children: [
                      Text((OfferData==null)?"":"${OfferData['description']}",
                          maxLines: 5,
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
                              builder: (context) => deliverd_details(id: OfferData['id'],price: OfferData['price'],title: OfferData['title'],),
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
                )),
          ],),
          // SizedBox(height: size.height*0.30,),
          // Spacer(),
          // Align(alignment: Alignment.bottomCenter,child: Container(
          //     padding: EdgeInsets.all(size.width*0.04),
          //     height: size.height*0.55,
          //     width: size.width,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(size.width*0.05),
          //         topRight: Radius.circular(size.width*0.05),
          //         //bottomLeft: Radius.circular(5),
          //         // bottomRight: Radius.circular(5)
          //       ),
          //     ),
          //     child: Column(
          //       children: <Widget>[
          //         Row(children: [
          //           Text((OfferData==null)?"":"${OfferData['title']}",
          //               style: new TextStyle(
          //                   fontSize: size.width*0.045,
          //                   color:  Colors.black,
          //                   fontWeight: FontWeight.bold,
          //                   fontFamily: 'jana'
          //               )),
          //         ],),
          //         Row(children: [
          //           Text((OfferData==null)?"":"${OfferData['price']} رس"+"   ",
          //               style: new TextStyle(
          //                   fontSize: size.width*0.10,
          //                   color:  Colors.green,
          //                   fontWeight: FontWeight.bold,
          //                   fontFamily: 'jana'
          //               )),
          //         ],),
          //         Row(children: [
          //           Text((OfferData==null)?"":"${OfferData['description']}",
          //               maxLines: 5,
          //               style: new TextStyle(
          //                   fontSize: size.width*0.03,
          //                   color:  Colors.grey,
          //                   fontWeight: FontWeight.bold,
          //                   fontFamily: 'jana'
          //               )),
          //         ],),
          //
          //         Spacer(),
          //         Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(
          //           onTap: (){
          //             print("Container clicked");
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => deliverd_details(id: OfferData['id'],price: OfferData['price'],title: OfferData['title'],),
          //                 ));
          //             //Navigator.pushNamed(context, "NewOrder2");
          //           },
          //           child:Container(width:size.width*0.90,padding: EdgeInsets.only(left: 8,right:8,top: 8,bottom: 8),
          //             decoration: BoxDecoration(
          //               color: color1,
          //               borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(8),
          //                   topRight: Radius.circular(8),
          //                   bottomLeft: Radius.circular(8),
          //                   bottomRight: Radius.circular(8)
          //               ),
          //             ),
          //             child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
          //
          //               Text("طلب شراء",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold),),
          //
          //               Container(
          //                 height: size.height*0.06,
          //                 width: size.height*0.06,
          //                 decoration: BoxDecoration(
          //                   color: Colors.white38,
          //                   borderRadius: BorderRadius.only(
          //                       topLeft: Radius.circular(5),
          //                       topRight: Radius.circular(5),
          //                       bottomLeft: Radius.circular(5),
          //                       bottomRight: Radius.circular(5)
          //                   ),
          //                 ),
          //                 child: Icon(Icons.shopping_cart,color: Colors.white,),
          //               ),
          //             ],),
          //
          //           ),),],) ,
          //       ],
          //     )),),


      ],),),),
    );
  }
  void getprofileData() async {
    print("id is ${widget.id}");
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      'https://amer.jit.sa/api/user/offer/show/${widget.id}',
      headers: {HttpHeaders.authorizationHeader: "$token","Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      OfferData = map['data']['offer'];

    });
  }
}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}