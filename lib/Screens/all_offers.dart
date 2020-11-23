import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../BNBCustompain.dart';


class all_offers extends StatefulWidget{
  int selectedID;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return all_offersState();
  }

}
class all_offersState extends State<all_offers>{
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  List Chat = new List();
  List sh = ['https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053668285faff42c99718.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053664315faff29f40e0b.jpg'];

  final TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void onButtonPressedV(context) {
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
            heightFactor: 0.60,
            child: BigListViewWidgetV(),
          );
        });
  }

  Widget BigListViewWidgetV() {
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
                    SizedBox(height: size.width*0.02,),
                    Row(children: [
                      Text("وصف العرض",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
                    ],),
                    Container(
                      //margin:EdgeInsets.only(left: 20,right: 20),
                      width: size.width,
                      child: Text(
                        "رفيق شخص مجتهد و أتمنى العمل معه مره أخرى دقيق السعر مناسب و محترم جداً و يستاهل و أنصح أي حد يتعامل معاه",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign:TextAlign.right,
                        style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                    ),
                    SizedBox(height: size.width*0.02,),
                    Row(children: [
                      Text("عينات لماتحتاجه",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
                    ],),
                    Container(
                      //margin:EdgeInsets.only(left: 20,right: 20),
                      height: size.height*0.15,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index){
                          return new InkWell(
                            onTap: (){
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
                                children: <Widget>[
                                  Container(
                                    width: size.width*0.30,
                                    height: size.height*0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      image: DecorationImage(
                                        image: NetworkImage("${sh[index]}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  //Align(alignment: Alignment.topRight,child:  ),



                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.width*0.02,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Row(children: [
                        Icon(Icons.assignment_turned_in_sharp,color: Colors.green,size: size.height*0.03,),
                        SizedBox(width: size.width*0.01,),
                        Text("قبول العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.width*0.04,color: Colors.green,fontFamily: 'Jana'),),
                      ],),
                      Row(children: [
                        Icon(Icons.message_rounded,color: Colors.red,size: size.height*0.03,),
                        SizedBox(width: size.width*0.01,),
                        Text("راسلني",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.width*0.04,color: Colors.red,fontFamily: 'Jana'),),
                      ],),
                      Row(children: [
                        Icon(Icons.delete_forever,color: Colors.red,size: size.height*0.03,),
                        SizedBox(width: size.width*0.01,),
                        Text("رفض العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.width*0.04,color: Colors.red,fontFamily: 'Jana'),),
                      ],),
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
          Text('جميع العروض',style: TextStyle(
              color: Colors.black,
              fontFamily: 'jana'
              ,fontWeight: FontWeight.bold,fontSize: 14),),
          Text('3658 عرض',style: TextStyle(
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
                  Text("جميع العروض",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: color1,fontFamily: 'Jana'),),

                  Text("أحدث العروض",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),

                  Text("الأقدم",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                  Text("الأقل سعر",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                ],),
                Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                  Container(margin:EdgeInsets.only(right: 10),width: size.width*0.25,height: 4,color: color1,),

                  Container(width: size.width*0.22,height: 4,color: Colors.grey[100],),

                  Container(width: size.width*0.22,height: 4,color: Colors.grey[100],),
                  Container(width: size.width*0.22,height: 4,color: Colors.grey[100],),
                ],)


              ],),
          SizedBox(height: size.height*0.02,),
          Expanded(child:ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(onTap:(){
                onButtonPressedV(context);
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
                            "رفيق شخص مجتهد و أتمنى العمل معه مره أخرى دقيق السعر مناسب و محترم جداً و يستاهل و أنصح أي حد يتعامل معاه",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign:TextAlign.right,
                            style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ),),
                        SizedBox(height: size.height*0.01,),
                        Expanded(flex:1,child:Container(margin:EdgeInsets.only(right: 20,left: 20),child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Row(children: [
                            Icon(Icons.assignment_turned_in_sharp,color: Colors.green,size: size.height*0.016,),
                            SizedBox(width: size.width*0.01,),
                            Text("قبول العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.height*0.015,color: Colors.green,fontFamily: 'Jana'),),
                          ],),
                          Row(children: [
                            Icon(Icons.message_rounded,color: Colors.red,size: size.height*0.016,),
                            SizedBox(width: size.width*0.01,),
                            Text("راسلني",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.height*0.015,color: Colors.red,fontFamily: 'Jana'),),
                          ],),
                          Row(children: [
                            Icon(Icons.delete_forever,color: Colors.red,size: size.height*0.016,),
                            SizedBox(width: size.width*0.01,),
                            Text("رفض العرض",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: size.height*0.015,color: Colors.red,fontFamily: 'Jana'),),
                          ],),
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




}