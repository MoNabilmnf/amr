import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import '../BNBCustompain.dart';
import 'details_price.dart';

class profile extends StatefulWidget{
  profile({this.id});
  int id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profileState();
  }

}
class profileState extends State<profile>{
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Map ProfileData ;
  List categories_with_offers = [];
  List rates = [];
  List name3 = ['قصر فخم للبيع','شقة تمليك','شقة ايجار'];
  List fa = [1,0,0];
  List faa = ['فلل','شقق شمال الرياض'];
  List price = ['10000 رس','2000 رس','260 رس'];
  int x = 0;
  List sh = ['https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053668285faff42c99718.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053664315faff29f40e0b.jpg'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprofileData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      
     body: Directionality(
       textDirection: TextDirection.rtl,
       child:Container(child:Column(children: [
         SizedBox(height: size.height*0.04,),
         Row(children: [
           SizedBox(width: 50,),

           Spacer(),

           IconButton(icon: Icon(Icons.arrow_back_rounded), onPressed: (){
             Navigator.pop(context);
           })
         ],),
         Container(margin:EdgeInsets.only(left: 20),child: Row(children: [
           Expanded(flex:4,child: ListTile(
             title:Row(children: [ Text(
               (ProfileData==null)?"":'${ProfileData['username']}',
               style: TextStyle(
                 color: Colors.black,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.035,
               ),
             ),],),
             leading: Container(
               margin: EdgeInsets.all(5),
               width: 60.0,
               height: 60.0,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
                 image: DecorationImage(
                   image: NetworkImage(
                       (ProfileData==null)?"https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png":"${ProfileData['image']}"),
                   fit: BoxFit.cover,
                 ),
               ),
             ),
             subtitle: Row(children: [
               Icon(Icons.location_on_outlined,color: color1,size: size.width*0.05,),
               Text(
                 'المملكه العربية السعودية',
                 style: TextStyle(
                   color: color1,
                   fontFamily: 'jana',
                   fontWeight: FontWeight.bold,
                   fontSize: size.width*0.025,
                 ),
               ),
             ],),
           ),),

           Expanded(flex:1,child:Container(
            // width: size.width*0.12,
             height: size.width*0.12,
             decoration: BoxDecoration(
               color: color2,
               borderRadius: BorderRadius.all(Radius.circular(5.0)),

             ),child: Column(children: [
             Text((ProfileData==null)?"":"${ProfileData['rate']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.orange,fontFamily: 'Jana'),),
             Row(mainAxisAlignment:MainAxisAlignment.center,children: [
               Icon(Icons.star,color: Colors.orange,size: 12,),
               Icon(Icons.star,color: Colors.orange,size: 12,),
               Icon(Icons.star,color: Colors.orange,size: 12,),
             ],),
           ],),
           ),),
         ],),),
         Container(margin:EdgeInsets.only(right: 20),child: Row(children: [
           Text(
             (ProfileData==null)?"":'${ProfileData['description']}',
             style: TextStyle(
               color: Colors.grey,
               fontFamily: 'jana',
               fontWeight: FontWeight.bold,
               fontSize: size.width*0.03,
             ),
           ),
         ],),),
         SizedBox(height: size.height*0.03,),
         Container(margin:EdgeInsets.only(right: 20,left: 20),child: Row(children: [
           Column(children: [
             Text(
               '200',
               style: TextStyle(
                 color: Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.05,
               ),
             ),
             Text(
               'بيعة ناجحة',
               style: TextStyle(
                 color: Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.03,
               ),
             ),
           ],),
           Spacer(),
           Column(children: [
             Text(
               '60 ألف',
               style: TextStyle(
                 color: Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.05,
               ),
             ),
             Text(
               'الأرباح',
               style: TextStyle(
                 color: Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.03,
               ),
             ),
           ],),
           Spacer(),
           Column(children: [
             Text(
               '220',
               style: TextStyle(
                 color: Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.05,
               ),
             ),
             Text(
               'عميل',
               style: TextStyle(
                 color: Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.03,
               ),
             ),
           ],),
           Spacer(),
           RaisedButton(
             onPressed: () async {

             },
             color: color1,
             child:  Text("أطلب منتجك",
                 style: new TextStyle(
                     fontSize: size.width*0.035,
                     color:  Colors.white,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'jana'
                 )),
           ),
         ],),),
         SizedBox(height: size.height*0.03,),
         Container(margin:EdgeInsets.only(right: 20,left: 20),height: size.height*0.06,
           width: size.width*0.90,
           decoration: BoxDecoration(
             color: Colors.grey[300],
             borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(5),
                 topRight: Radius.circular(5),
                 bottomLeft: Radius.circular(5),
                 bottomRight: Radius.circular(5)
             ),
           ),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
             GestureDetector(onTap: (){
               setState(() {
                 x = 0;
               });
             },child: Container(margin:EdgeInsets.all(size.width*0.01),height: size.height*0.06,
               width: size.width*0.40,
               decoration: BoxDecoration(
                 color: (x==0)?Colors.white:Colors.grey[300],
                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(5),
                     topRight: Radius.circular(5),
                     bottomLeft: Radius.circular(5),
                     bottomRight: Radius.circular(5)
                 ),
               ),child: Center(child: Text("المنتجات" ,style: TextStyle(
                 color: (x==0)?Colors.black:Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.03,
               ),),)),),
             GestureDetector(onTap: (){

               setState(() {
                 x = 1;
               });
             },child: Container(margin:EdgeInsets.all(size.width*0.01),height: size.height*0.06,
               width: size.width*0.40,
               decoration: BoxDecoration(
                 color: (x==1)?Colors.white:Colors.grey[300],
                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(5),
                     topRight: Radius.circular(5),
                     bottomLeft: Radius.circular(5),
                     bottomRight: Radius.circular(5)
                 ),
               ),child: Center(child: Text("التقييمات", style: TextStyle(
                 color: (x==1)?Colors.black:Colors.grey,
                 fontFamily: 'jana',
                 fontWeight: FontWeight.bold,
                 fontSize: size.width*0.03,
               ),),),),),
         ],),),
         SizedBox(height: size.height*0.03,),
         (x == 1)?
         Expanded(child:(rates.isEmpty)?Container():ListView.builder(
           shrinkWrap: true,
           itemCount: rates.length,
           itemBuilder: (BuildContext context, int index) {
             return Card(margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
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
                       Container(margin:EdgeInsets.only(left: 20),child: Row(children: [
                         Expanded(flex:4,child: ListTile(
                           title:Row(children: [ Text(
                             '${rates[index]['user']['username']}',
                             style: TextStyle(
                               color: Colors.black,
                               fontFamily: 'jana',
                               fontWeight: FontWeight.bold,
                               fontSize: size.width*0.035,
                             ),
                           ),],),
                           leading: Container(
                             //margin: EdgeInsets.all(5),
                             width: size.width*0.11,
                             height: size.width*0.11,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(8.0)),
                               image: DecorationImage(
                                 image: NetworkImage(
                                     "${rates[index]['user']['image']}"),
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                           subtitle: Row(children: [
                             StarRating(
                               color: Colors.yellow,
                               starCount: 5,
                               rating: double.parse("${rates[index]['rate']}"),
                               size: 14,
                             ),
                           ],),
                         ),),

                         Expanded(flex:1,child:Container(
                           width: size.width*0.11,
                           height: size.width*0.11,
                           decoration: BoxDecoration(
                             color: color2,
                             borderRadius: BorderRadius.all(Radius.circular(5.0)),

                           ),child: Column(children: [
                           Text("${rates[index]['rate']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.035,color: Colors.orange,fontFamily: 'Jana'),),
                           Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                             Icon(Icons.star,color: Colors.orange,size: 12,),
                             Icon(Icons.star,color: Colors.orange,size: 12,),
                             Icon(Icons.star,color: Colors.orange,size: 12,),
                           ],),
                         ],),
                         ),),
                       ],),),
                       Container(
                         margin:EdgeInsets.only(left: 20,right: 20),
                         width: size.width,
                         child: Text(
                           "${rates[index]['feedback']}",
                           overflow: TextOverflow.ellipsis,
                           maxLines: 3,
                           textAlign:TextAlign.right,
                           style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,fontWeight: FontWeight.bold,color: Colors.grey),
                         ),
                       ),
                     ],
                   )),);
           },
         ),)
         :
           Expanded(child:ListView.builder(
             shrinkWrap: true,
             itemCount: 2,
             itemBuilder: (BuildContext context, int index) {
               return  Container(
                     margin: EdgeInsets.only(left: 20,right: 20),
                     height: size.height*0.35,
                     decoration: BoxDecoration(
                       //color: Colors.white,
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(5),
                           topRight: Radius.circular(5),
                           bottomLeft: Radius.circular(5),
                           bottomRight: Radius.circular(5)
                       ),
                     ),
                     child: Column(
                       children: <Widget>[
                         Container(
                           child: Row(mainAxisAlignment:MainAxisAlignment.start,children: [
                           Text(faa[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
                           Spacer(),

                           GestureDetector(onTap: (){

                           },child:Text("عرض الكل",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey,fontFamily: 'Jana'),),),
                           Text("  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey,fontFamily: 'Jana'),),
                           Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,size: 12,),
                         ],),),
                         Container(

                           //margin:EdgeInsets.only(left: 20,right: 20),
                           height: size.height*0.30,
                           child: ListView.builder(
                             shrinkWrap: true,
                             scrollDirection: Axis.horizontal,
                             itemCount: 3,
                             itemBuilder: (BuildContext context, int index){
                               return new InkWell(
                                 onTap: (){
                                   print("asdasdname");
                                   //Navigator.pop(context);
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => details_price(),
                                       ));
                                 },
                                 child:  Container(
                                   // alignment: Alignment.centerRight,
                                   // padding: EdgeInsets.all(12),
                                   margin: EdgeInsets.only(left: 10),
                                   decoration: BoxDecoration(
                                     // color: Colors.white,
                                     borderRadius: BorderRadius.only(
                                         topLeft: Radius.circular(10),
                                         topRight: Radius.circular(10),
                                         bottomLeft: Radius.circular(10),
                                         bottomRight: Radius.circular(10)
                                     ),
                                   ),
                                   //width: 120,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: <Widget>[
                                       Stack(alignment:Alignment.topLeft,children: [
                                         Container(
                                           width: size.width*0.30,
                                           height: size.height*0.20,
                                           decoration: BoxDecoration(
                                             color: Colors.white,
                                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                             image: DecorationImage(
                                               image: NetworkImage("${sh[index]}"),
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                         ),
                                         Align(alignment: Alignment.topLeft,child: GestureDetector(onTap: (){
                                           print("hghgghghgh");
                                           setState(() {
                                             (fa[index] == 1)?fa[index] = 0:fa[index] = 1;
                                           });
                                         },child:Container(margin:EdgeInsets.all(size.width*0.015),child: (fa[index] == 1)?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.grey,),)),),


                                       ],),

                                       //Align(alignment: Alignment.topRight,child:  ),
                                       Row(children: [
                                         Column(mainAxisAlignment:MainAxisAlignment.start,children: [
                                           Text(
                                             name3[index],
                                             style: TextStyle(
                                                 color: Colors.grey,
                                                 fontFamily: 'jana',
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.bold
                                             ),
                                           ),
                                           Text(
                                             price[index],
                                             style: TextStyle(
                                                 color: color1,
                                                 fontFamily: 'jana',
                                                 fontSize: 10,
                                                 fontWeight: FontWeight.bold
                                             ),
                                           ),
                                         ],),
                                       ],),


                                     ],
                                   ),
                                 ),
                               );
                             },
                           ),
                         ),
                       ],
                     ));
             },
           ),),




     ],),),),
    );
  }
  void getprofileData() async {
    print("id is ${widget.id}");
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      'https://amer.jit.sa/api/user/vendor-details/${widget.id}',
      headers: {HttpHeaders.authorizationHeader: "$token","Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      ProfileData = map['data']['vendor'];
      categories_with_offers = map['data']['categories_with_offers'];
      rates = map['data']['rates'];
    });
  }
}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}