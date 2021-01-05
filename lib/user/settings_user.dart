import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:amr/user/messages_user.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amr/Screens/ChatScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../BNBCustompain.dart';
import '../Global.dart';
import 'ForgotPass_user.dart';
import 'Home_user.dart';
import 'discover_user.dart';
import 'login_user.dart';

class settings_user extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return settings_userState();
  }

}
class settings_userState extends State<settings_user>{
  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller3 = new TextEditingController();
  final TextEditingController _controller4 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Color color3 = colorFromHex("#0acb83");
  Color color4 = colorFromHex("#ececec");
  Color color5 = colorFromHex("##848484");
  Color color6 = colorFromHex("##e6faf2");
  Color color7 = colorFromHex("#242a38");
  int main = 4;
  bool saturday = false;
  bool saturday2 = false;
  List col33 = [0,1,0,0,0];
  List name44 = ['شقق','أراضي','فلل'];
  List name_radio = ['النقل','القيروان','العارض','الصحافة','المروج','المصيف','النخيل'];
  List name_radio2 = ['النقل','القيروان','العارض','الصحافة','المروج','المصيف','النخيل'];
  List name33 = ['عقارات','سيارات','كماليات','تسوق','مشتريات'];
  List fa = [1,0,0];
  List name_radio22 = ['الرياض','القيروان','العارض','جده','مكه'];
  List ic33 = [Icons.home,Icons.directions_car,Icons.accessibility_new_rounded,Icons.shopping_cart,Icons.assignment];
  List sh = ['https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053668285faff42c99718.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053664315faff29f40e0b.jpg'];
  List groupss=[0,0,0,0,0,0,0,0];
  String imageProfile='';
  List<String> images = ["https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg", "https://www.caa.com/sites/default/files/styles/headshot_500x500/public/speaker-headshots/ParsonsJ_headshot_web.jpg?itok=iu-I0aZJ"];
  final picker = ImagePicker();
  List<File>  ImageFiles = [];
  String _value;
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
            heightFactor: 0.70,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child:Text("المتجات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),),
                    Row(children: [
                      Text("فلل",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
                    ],),
                    new Expanded(
                        child:GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(8, (index) {
                            return  GestureDetector(
                                child:Card(
                                    color: Colors.white,
                                    child: Container(padding: EdgeInsets.all(size.width*0.02,),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        image: DecorationImage(
                                          image: NetworkImage("https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      //margin: EdgeInsets.all(5),
                                      child:
                                      Stack(children: [
                                        // Align(alignment: Alignment.bottomRight,child: GestureDetector(onTap: (){
                                        //   print("hghgghghgh");
                                        //   setState(() {
                                        //     //(fa[index] == 1)?fa[index] = 0:fa[index] = 1;
                                        //   });
                                        // },child:Container(margin:EdgeInsets.all(5),child: Column(children: [
                                        //   Text("فلة في العارض",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.03,color: Colors.white,fontFamily: 'Jana'),),
                                        //   Text("477 رس",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.03,color: color1,fontFamily: 'Jana'),),
                                        // ],),)),),
                                        Align(alignment: Alignment.bottomRight,child:Column(mainAxisSize: MainAxisSize.min,children: [
                                          Text("فلة في العارض",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.03,color: Colors.white,fontFamily: 'Jana'),),
                                          Text("477 رس",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.03,color: color1,fontFamily: 'Jana'),),
                                        ],)),
                                        Align(alignment: Alignment.topLeft,child: GestureDetector(onTap: (){
                                          print("hghgghghgh");
                                          setState(() {
                                            //(fa[index] == 1)?fa[index] = 0:fa[index] = 1;
                                          });
                                        },child:Container(margin:EdgeInsets.all(5),child: Icon(Icons.favorite,color: Colors.red,size: size.width*0.08,),)),),




                                        //],),


                                      ],),
                                    )),onTap:(){

                            });

                          }),)),
                  ],
                )),);
        });
  }
  void onButtonPressed(context) {
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
            heightFactor: 0.70,
            child: BigListViewWidget(),
          );
        });
  }

  Widget BigListViewWidget() {
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
          final Size size = MediaQuery.of(context).size;
          return Directionality(
            textDirection: TextDirection.rtl,
            child:Container(padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child:Text("البائعين",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),),
                    Row(children: [
                      Text("العقار",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
                    ],),
                    new Expanded(
                        child:GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(8, (index) {
                            return  GestureDetector(
                                child:Card(
                                    color: Colors.white,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(children: <Widget>[
                                        Row(children: [
                                          Container(
                                            width: size.width*0.12,
                                            height: size.width*0.12,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                              image: DecorationImage(
                                                image: NetworkImage("https://scontent.fcai21-2.fna.fbcdn.net/v/t1.0-9/51708364_2011415955560256_2886851547768029184_n.png?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=XXH_wJpZkCMAX_2I_lK&_nc_ht=scontent.fcai21-2.fna&oh=e6373af721ca662ba01095d81441fec6&oe=5FD942F4"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: size.width*0.12,
                                            height: size.width*0.12,
                                            decoration: BoxDecoration(
                                              color: color2,
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),

                                            ),child: Column(children: [
                                            Text("4.9",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.orange,fontFamily: 'Jana'),),
                                            Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                                              Icon(Icons.star,color: Colors.yellowAccent,size: 12,),
                                              Icon(Icons.star,color: Colors.yellowAccent,size: 12,),
                                              Icon(Icons.star,color: Colors.yellowAccent,size: 12,),
                                            ],),
                                          ],),
                                          ),
                                        ],),
                                        SizedBox(height: size.height*0.01,),
                                        Text("مكتب الهدف العقاري",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.03,color: Colors.black,fontFamily: 'Jana'),),
                                        Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                                          Icon(Icons.location_on_outlined,color: color1,size: size.width*0.04,),
                                          Text("المملكة العربية السعودية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.02,color: color1,fontFamily: 'Jana'),),

                                        ],),
                                        //SizedBox(height: 5,),
                                        SizedBox(height: size.height*0.01,),
                                        Container(child: Text(
                                          "مكتب متخصص في عقارات شمال الرياض",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign:TextAlign.center,
                                          style: TextStyle(fontFamily: 'jana',fontSize: size.width*0.03,color: Colors.grey),
                                        ),),


                                      ],),
                                    )),onTap:(){

                            });

                          }),)),
                  ],
                )),);
        });
  }


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
            child: BigListViewWidgetfloat(),
          );
        });
  }


  Widget BigListViewWidgetfloat() {
    Widget BigListViewWidgetEE() {
      String groub;
      List groups=['asdsd','القيروان','asa','الصحافة','المروج',];

      return StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
            final Size size = MediaQuery.of(context).size;
            return Directionality(
              textDirection: TextDirection.rtl,
              child:Container(padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(children: [
                        Text('المدينة',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      new Expanded(
                        child:ListView.builder(
                          shrinkWrap: true,
                          itemCount: name_radio.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                child: Row(
                                  children: <Widget>[
                                    Text("    "),
                                    Text(name_radio[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
                                    Spacer(),

                                    Radio(
                                        activeColor: color1,
                                        value: 1,
                                        groupValue: groupss[index],
                                        onChanged: (T) {
                                          print(T);
                                          setState(() {
                                            groupss.insert(index, T);
                                            //groub = T;
                                          });
                                        }),
                                    Text("  ")
                                  ],
                                ));
                          },
                        ),),
                    ],
                  )),);

          });
    }
    Widget BigListViewWidgetEEE() {
      String groub;
      List groups=['asdsd','القيروان','asa','الصحافة','المروج',];

      return StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
            final Size size = MediaQuery.of(context).size;
            return Directionality(
              textDirection: TextDirection.rtl,
              child:Container(padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(children: [
                        Text('المدينة',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      new Expanded(
                        child:ListView.builder(
                          shrinkWrap: true,
                          itemCount: name_radio22.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                child: Row(
                                  children: <Widget>[
                                    Text("    "),
                                    Text(name_radio22[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
                                    Spacer(),

                                    Radio(
                                        activeColor: color1,
                                        value: 1,
                                        groupValue: groupss[index],
                                        onChanged: (T) {
                                          print(T);
                                          setState(() {
                                            groupss.insert(index, T);
                                            //groub = T;
                                          });
                                        }),
                                    Text("  ")
                                  ],
                                ));
                          },
                        ),),
                    ],
                  )),);

          });
    }
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
          void onButtonPressedEE(context) {
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
                    heightFactor: 0.50,
                    child: BigListViewWidgetEE(),
                  );
                });
          }

          void onButtonPressedEEE(context) {
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
                    heightFactor: 0.50,
                    child: BigListViewWidgetEEE(),
                  );
                });
          }
          Future getImageFiles() async {
            final pickedFile = await picker.getImage(source: ImageSource.gallery);

            setState(() {
              if (pickedFile != null) {
                ImageFiles.add(File(pickedFile.path));
                //_image = File(pickedFile.path);
              } else {
                print('No image selected.');
              }
            });
          }
          final Size size = MediaQuery.of(context).size;
          return Directionality(
              textDirection: TextDirection.rtl,
              child:Container(child:SingleChildScrollView(scrollDirection: Axis.vertical,child:Container(padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(child:Text("إنشاء طلب جديد",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),),
                      Row(children: [
                        Text("عينات لما تحتاجه",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      Row(children: [
                        Expanded(flex:1,child: InkWell(
                          onTap: (){
                            getImageFiles();
                            //getImage();
                          },
                          child: Container(margin: EdgeInsets.only(right: 1,left: 10),child: DottedBorder(
                            color: Colors.grey,
                            strokeWidth: 1,
                            dashPattern: [8, 4],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            //padding: EdgeInsets.all(6),
                            //strokeCap: StrokeCap.round,
                            child: Container(
                              // margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
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

                                  Icon(Icons.cloud_upload,color: Colors.grey,),
                                  // Text(
                                  //   'الأراضي',
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //     fontFamily: 'jana',
                                  //     fontSize: 14,
                                  //   ),
                                  // ),

                                ],
                              ),
                            ),),),
                        ),),
                        Expanded(flex:2,child: ImageFiles == null
                            ? Text('')
                            :Container(
                          height: 100.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: ImageFiles.length,
                            itemBuilder: (BuildContext context, int index){
                              return new InkWell(
                                  onTap: (){

                                  },
                                  child: Center(child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)
                                      ),
                                    ),
                                    width: 100,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Icon(Icons.location_on_outlined,color: Colors.white,),
                                        // Text(
                                        //   'الأراضي',
                                        //   style: TextStyle(
                                        //     color: Colors.white,
                                        //     fontFamily: 'jana',
                                        //     fontSize: 14,
                                        //   ),
                                        // ),

                                        Image.file(ImageFiles[index]),

                                      ],
                                    ),
                                  ),)
                              );
                            },
                          ),
                        ),),
                      ],),
                      Row(children: [
                        Text("عنوان الطلب",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      Container(height:70,child: TextField(
                        controller: _controller3,
                        keyboardType: TextInputType.text,
                        maxLength: 50,
                        maxLines: 2,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "jana",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب',
                          hintStyle: TextStyle(color: Colors.black),
                        ),

                      ),),
                      // Container(
                      //   width: size.width,
                      //   child: Text(
                      //     "أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب",
                      //     overflow: TextOverflow.ellipsis,
                      //     maxLines: 2,
                      //     textAlign:TextAlign.right,
                      //     style: TextStyle(fontFamily: 'jana',fontSize: 16,fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Row(children: [
                        Text("وصف قصير",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      Container(height:70,child: TextField(
                        controller: _controller4,
                        keyboardType: TextInputType.text,
                        maxLength: 50,
                        maxLines: 2,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "jana",
                            color: Colors.grey,
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
                          hintText: 'السلام عليكم أبحث عن شقه في شمال الرياض سكن ثلاث أفراد طلاب جامعيين و يكون سعرها مناسب لمدة تقريباً أربع سنوات أو أكثر',
                          hintStyle: TextStyle(fontFamily: 'jana',fontSize: 14,fontWeight: FontWeight.bold),
                        ),

                      ),),
                      // Container(
                      //   width: size.width,
                      //   child: Text(
                      //     "السلام عليكم أبحث عن شقه في شمال الرياض سكن ثلاث أفراد طلاب جامعيين و يكون سعرها مناسب لمدة تقريباً أربع سنوات أو أكثر",
                      //     overflow: TextOverflow.ellipsis,
                      //     maxLines: 3,
                      //     textAlign:TextAlign.right,
                      //     style: TextStyle(fontFamily: 'jana',fontSize: 14,fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      SizedBox(height: size.height*0.02,),
                      Row(children: [
                        Text("تصنيفات و كلمات مفتاحية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      Container(
                        height: size.height*0.15,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index){
                            return new InkWell(
                                onTap: (){
                                  setState(() {
                                    col33 = [0,0,0,0,0];
                                    col33[index] = 1;
                                  });
                                },
                                child: Center(child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: (col33[index] == 0)?Colors.grey[300]:color2,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)
                                      ),
                                      border:(col33[index] == 1)? Border.all(color: color1):null
                                  ),
                                  width: 100,
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Icon(ic33[index],color: (col33[index] == 0)?Colors.grey:color1,),
                                      Text(
                                        name33[index],
                                        style: TextStyle(
                                          color: (col33[index] == 0)?Colors.grey:color1,
                                          fontFamily: 'jana',
                                          fontSize: 14,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),)
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Row(children: [
                        Container(
                          height: size.height*0.05,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index){
                              return new InkWell(
                                  onTap: (){
                                    setState(() {
                                      fa = [0,0,0,];
                                      fa[index] = 1;
                                    });
                                  },
                                  child: Center(child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        color: (fa[index] == 0)?Colors.grey[300]:color2,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)
                                        ),
                                        border:(fa[index] == 1)? Border.all(color: color1):null
                                    ),
                                    width: 50,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        //Icon(ic33[index],color: (col33[index] == 0)?Colors.grey:color1,),
                                        Text(
                                          name44[index],
                                          style: TextStyle(
                                            color: (fa[index] == 0)?Colors.grey:color1,
                                            fontFamily: 'jana',
                                            fontSize: 14,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),)
                              );
                            },
                          ),
                        ),
                      ],),
                      SizedBox(height: size.height*0.02,),
                      Row(children: [
                        Text("الموقع",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        GestureDetector(onTap: (){
                          print('bess');
                          onButtonPressedEEE(context);
                        },
                          child:Row(children: [
                            Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)
                                ),
                              ),
                              child: Column(children: [
                                Row(children: [
                                  Text('المدينة',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                                ],),
                                SizedBox(height: size.height*0.01,),
                                GestureDetector(onTap: (){
                                  print('bess');
                                },
                                  child: Row(children: [
                                    Text('قطن',style: TextStyle(fontSize: 16.0,fontFamily: 'jana',color: Colors.black)),
                                    Spacer(),
                                    Icon(Icons.arrow_drop_down,color: Colors.black,size: 22,),
                                  ],),),



                              ],),

                            ),
                          ],),),
                        GestureDetector(onTap: (){
                          print('bess');
                          onButtonPressedEE(context);
                        },
                          child:Row(children: [
                            Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)
                                ),
                              ),
                              child: Column(children: [
                                Row(children: [
                                  Text('الحي',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                                ],),
                                SizedBox(height: size.height*0.01,),
                                GestureDetector(onTap: (){
                                  print('bess');
                                },
                                  child: Row(children: [
                                    Text('الحي',style: TextStyle(fontSize: 16.0,fontFamily: 'jana',color: Colors.black)),
                                    Spacer(),
                                    Icon(Icons.arrow_drop_down,color: Colors.black,size: 22,),
                                  ],),),



                              ],),

                            ),
                          ],),),
                      ],),

                      SizedBox(height: size.height*0.02,),
                      Row(children: [
                        Text("الميزانية المتاحة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey,fontFamily: 'Jana'),),
                      ],),
                      Row(children: [
                        Container(margin:EdgeInsets.all(8),color: Colors.grey[300],height: 45,width:size.width*0.40,child:TextField(
//            maxLength: 40,
                          textAlign: TextAlign.center,
                          controller: _controller1,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          autofocus: false,
                          style: TextStyle(fontSize: 16.0, color: Colors.black,fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white38,
                            hintText: '3500 \$',
                            hintStyle: TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold),
                            contentPadding: const EdgeInsets.only(
                              left: 8.0,
                              bottom: 8.0,
                              top: 8.0,
                              right: 8.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),),
                        Spacer(),
                        Container(margin:EdgeInsets.all(8),color: Colors.grey[300],height: 45,width:size.width*0.40,child:TextField(
//            maxLength: 40,
                          textAlign: TextAlign.center,
                          controller: _controller2,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          autofocus: false,
                          style: TextStyle(fontSize: 16.0, color: Colors.black,fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white38,
                            hintText: '5000 \$',
                            hintStyle: TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold),
                            contentPadding: const EdgeInsets.only(
                              left: 8.0,
                              bottom: 8.0,
                              top: 8.0,
                              right: 8.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),)
                      ],),
                      SizedBox(height: size.height*0.02,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(
                        onTap: (){
                          print("Container clicked");
                          Navigator.pop(context);
                          //Navigator.pushNamed(context, "NewOrder2");
                        },
                        child:Container(width:size.width*0.80,padding: EdgeInsets.only(left: 8,right:8,top: 8,bottom: 8),
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

                            Text("نشر الطلب",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold),),

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
                              child: Icon(Icons.upload_rounded,color: Colors.white,),
                            ),
                          ],),

                        ),),],) ,
                      SizedBox(height: size.height*0.02,),
                    ],
                  )),)));
        });
  }
  void getAPI() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get((sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/profile":'https://amer.jit.sa/api/vendor/profile',headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
      imageProfile = map['data']['image'];
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPI();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,

      body:SingleChildScrollView(scrollDirection: Axis.vertical,child:Container(child:Column(children: [
        Container(margin: EdgeInsets.only(top: 30,bottom: 20,right: 20),child: Column(children: [
          Row(children: [
            SizedBox(width: 50,),
            Spacer(),
            Text(
              'الإعدادات',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 20,
              ),
            ),
            Spacer(),

            Stack(children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  image: DecorationImage(
                    image: NetworkImage("$imageProfile"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(children: [

                Container(
                  width: 15.0,
                  height: 15.0,
                  decoration:
                  new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.green,
                    border: new Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),

                ),
              ],),
            ],),
          ],),
          SizedBox(height: 20,),
          Row(mainAxisAlignment:MainAxisAlignment.end,children: [
            Text("حسابي",style: TextStyle(fontFamily: 'jana',fontWeight: FontWeight.bold),),
            Text("     "),
            Icon(Icons.account_circle,color: Colors.black,),
          ],),
          SizedBox(height: 8,),
          Divider(height: 2,),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
              print("Container clicked");
              print("Container clicked");
              Navigator.pushNamed(context, "EditAccount");
            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              SizedBox(width: 15,),
              Icon(Icons.arrow_back_ios,color: Colors.black,size: 14,),
              Spacer(),
              Text("تعديل الحساب",style: TextStyle(fontFamily: 'jana'),),
              //SizedBox(width: 5,),
            ],),),),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
              print("Container clicked");
              Navigator.pushNamed(context, "ForgotPass_user");
            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              SizedBox(width: 15,),
              Icon(Icons.arrow_back_ios,color: Colors.black,size: 14,),
              Spacer(),
              Text("كلمة المرور",style: TextStyle(fontFamily: 'jana'),),
              //SizedBox(width: 5,),
            ],),),),

          SizedBox(height: 20,),
          Row(mainAxisAlignment:MainAxisAlignment.end,children: [
            Text("الإشعارات",style: TextStyle(fontFamily: 'jana',fontWeight: FontWeight.bold),),
            Text("     "),
            Icon(Icons.notifications,color: Colors.black),
          ],),
          SizedBox(height: 8,),
          Divider(height: 2,),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
              print("Container clicked");
            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              Transform.scale(
                scale: 0.7,
                child:CupertinoSwitch(
                  activeColor: color1,
                  trackColor: color7,
                  value: saturday2,
                  onChanged: (value) async {
                    setState(() {
                      saturday2 = value;
                    });
                  },
                ),),
              //Icon(Icons.arrow_back_ios,color: Colors.black,),
              Spacer(),
              Text("تشغيل الإشعارات",style: TextStyle(fontFamily: 'jana'),),
             // SizedBox(width: 5,),
            ],),),),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
              print("Container clicked");
            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              Transform.scale(
                scale: 0.7,
                child:CupertinoSwitch(
                  activeColor: color1,
                  trackColor: color7,
                  value: saturday,
                  onChanged: (value) async {
                    setState(() {
                      saturday = value;
                    });
                  },
                ),),
             // Icon(Icons.arrow_back_ios,color: Colors.black,),
              Spacer(),
              Text("صوت الإشعارات",style: TextStyle(fontFamily: 'jana'),),
              SizedBox(width: 5,),
            ],),),),
          SizedBox(height: 20,),
          Row(mainAxisAlignment:MainAxisAlignment.end,children: [
            Text("عن التطبيق",style: TextStyle(fontFamily: 'jana',fontWeight: FontWeight.bold),),
            Text("     "),
            Icon(Icons.flag,color: Colors.black,),
          ],),
          SizedBox(height: 8,),
          Divider(height: 2,),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
              print("Container clicked");
            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              SizedBox(width: 15,),
              Icon(Icons.arrow_back_ios,color: Colors.black,size: 14,),

              Spacer(),
              Text("الدعم الفني",style: TextStyle(fontFamily: 'jana'),),
              //SizedBox(width: 5,),
            ],),),),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
              print("Container clicked");
            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              SizedBox(width: 15,),
              Icon(Icons.arrow_back_ios,color: Colors.black,size: 14,),
              Spacer(),
              Text("عن آمر",style: TextStyle(fontFamily: 'jana'),),
              //SizedBox(width: 5,),
            ],),),),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: () async {
              SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
              sharedPrefs.remove('UserType');
              //print("Container clicked");
              print(sharedPrefs.getString('UserType'));
            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              SizedBox(width: 15,),
              Icon(Icons.arrow_back_ios,color: Colors.black,size: 14,),
              Spacer(),
              Text("الآمان و الخصوصية",style: TextStyle(fontFamily: 'jana'),),
              //SizedBox(width: 5,),
            ],),),),
          SizedBox(height: 8,),
          Divider(height: 2,),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: () async {
              SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
              print("Container clicked");

              if(user_type == 'مشتري'){
                String Res = await Logout('https://amer.jit.sa/api/user/logout');
                if(Res == "success"){
                  sharedPrefs.remove('UserType');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login_user(),
                      ));
                }

              }else{
                String Res = await Logout('https://amer.jit.sa/api/vendor/logout');
                if(Res == "success"){
                  sharedPrefs.remove('UserType');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login_user(),
                      ));
                }

              }

            },
            child:Container(child: Row(mainAxisAlignment:MainAxisAlignment.end,children: [
              SizedBox(width: 10,),
              Container(child: Icon(Icons.arrow_back_rounded,color: Colors.white,),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
              Spacer(),
              Text("تسجيل الخروج",style: TextStyle(fontFamily: 'jana',fontWeight: FontWeight.bold),),
             // SizedBox(width: 5,),
            ],),),),
        ],),),
        // Expanded(flex: 1,
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child:  Container(child:
        //     // Stack(children: [
        //     Positioned(left: 0,bottom: 0,child: Container(width: size.width,height: 70,child: Stack(children: [
        //       CustomPaint(size: Size(size.width,70),painter: BNBCustompain(),),
        //       Center(heightFactor: 0.1,child: FloatingActionButton(onPressed: (){
        //
        //       },backgroundColor: color1,child: Icon(Icons.add,size: 35,),elevation: 0.1,),),
        //       Container(margin:EdgeInsets.only(top: 8),height:50,child:
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //
        //
        //
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
        //           Container(width: size.width*0.20,),
        //
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
      ],),)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("cleck flat");
          onButtonPressedfloat(context);
        },
        backgroundColor: color1,
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        //centerItemText: 'เสา',
        color: Colors.grey,
        backgroundColor: color7,
        selectedColor: color1,
        notchedShape: CircularNotchedRectangle(),
        // onTabSelected: _onTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.settings, text: 'الإعدادات'),
          FABBottomAppBarItem(iconData: Icons.messenger, text: 'الرسائل'),
          FABBottomAppBarItem(iconData: Icons.widgets, text: 'إكتشف'),
          FABBottomAppBarItem(iconData: Icons.home, text: 'الرئيسية'),
        ],
      ),

    );
  }

}
class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }
  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              if(index == 3){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_user(),
                    ));
              }else if(index == 2){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => discover_user(),
                    ));
              }else if(index == 1){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => messages_user(),
                    ));
              }else if(index == 0){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => settings_user(),
                    ));
              }
              print("new page $index");
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color,fontFamily: 'Jana',),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}