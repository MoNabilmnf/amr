
import 'dart:convert';
import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:amr/Global.dart';
import 'package:amr/Screens/notification.dart';
import 'package:amr/Screens/order_ditails.dart';
import 'package:amr/user/login_user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:amr/user/discover_user.dart';
import 'package:amr/user/messages_user.dart';
import 'package:amr/user/settings_user.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_stack/image_stack.dart';
import 'package:amr/BNBCustompain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserOrder.dart';

class Home_user extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Home_userState();
  }

}
class Home_userState extends State<Home_user>{
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
  List col33 = [0,1,0,0,0];
  bool Ha = false;
  List<String> Cats = new List();
  List<String> City = new List();
  List<String> SubCat = new List();
  ScrollController _scrollController = ScrollController();
  int CatID ;
  List Imagess = [];
  List S = [];
  List C ;
  List done_orders =[];
  String username='';
  String profileImage = '';
  Map Profile ;
  List SC = [];
  List Dis = [];
  int CityId ,DicId;
  String CityName = 'المدينة';
  String DicName = 'الحي';
  int SubCatId;
  String _value1,_value2;
  List name44 = ['شقق','أراضي','فلل'];
  List name_radio = ['النقل','القيروان','العارض','الصحافة','المروج','المصيف','النخيل'];
  List name_radio22 = ['الرياض','القيروان','العارض','جده','مكه'];
  List name_radio2 = ['النقل','القيروان','العارض','الصحافة','المروج','المصيف','النخيل'];
  List name33 = ['عقارات','سيارات','كماليات','تسوق','مشتريات'];
  int main = 2;
  List fa = [1,0,0];
  List ic33 = [Icons.home,Icons.directions_car,Icons.accessibility_new_rounded,Icons.shopping_cart,Icons.assignment];
  List sh = ['https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053668285faff42c99718.jpg','https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053664315faff29f40e0b.jpg'];
  List groupss=[0,0,0,0,0,0,0,0];
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
            child: UserOrder(),
            //BigListViewWidgetfloat(),
          );
        });
  }


  Widget BigListViewWidgetfloat() {

    Widget BigListViewWidgetEEE() {
      String groub;
      List groups=['asdsd','القيروان','asa','الصحافة','المروج',];

      return StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
            bool c =false;
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
                          itemCount: City.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                child: Row(
                                  children: <Widget>[
                                    Text("    "),
                                    Text(City[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
                                    Spacer(),

                                    Radio(
                                        activeColor: color1,
                                        value: City[index],
                                        groupValue: groub,
                                        onChanged: (T) async {
                                          print(T);
                                          setState(()  {
                                            groub = T;
                                            int postion = City.indexOf(T);
                                            CityId =C[postion]['id'];
                                            CityName = T;
                                            //Navigator.pop(context);



                                            //groupss.insert(index, T);

                                          });
                                          // List check = await getDic(CityId);
                                          //                                           // if(check.isNotEmpty){
                                          //                                           //   setState((){
                                          //                                           //     c = true;
                                          //                                           //   });
                                          //                                           // }
                                          print(CityId);
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
          List<String> D = new List();
          List Dicc= [];

          getDic(id) async {
            http.Response response = await http.get('https://amer.jit.sa/api/cities/$id',headers: {"Accept":"application/json"},);
            Map map = json.decode(response.body);
            print(map);
            setState(() {
              Dicc = map['data']['cities'];
              for(int i = 0 ; i <Dicc.length; i++){
                D.add(Dicc[i]['title']);
              }
            });
            return D;
            //onButtonPressedfloat(context);
          }
          final Size size = MediaQuery.of(context).size;
          int CityIdd,DicIdd;
          List<String> ssss = new List();

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

                      Container(child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
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
                            DropdownButtonHideUnderline(child:DropdownButton<String>(
                              value: _value1,
                              isExpanded: true,
                              // items: [
                              //   DropdownMenuItem<String>(
                              //     child: Text('قطن',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                              //     value: '1',
                              //   ),
                              //   DropdownMenuItem<String>(
                              //     child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                              //     value: '2',
                              //   ),
                              //   DropdownMenuItem<String>(
                              //     child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                              //     value: '3',
                              //   ),
                              // ],
                              items: City.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value,style: TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                              onChanged: (String value) async {
                                setState(()  {
                                  int postion = City.indexOf(value);
                                  print("$value");
                                  _value1 = value;
                                  CityId =C[postion]['id'];

                                  // _isChose = true;
                                });
                                ssss = await getDic(CityId);
                                if(D.isNotEmpty){
                                  setState(()  {
                                    print("$ssss");
                                    //D.addAll(ssss);
                                   // Dis.addAll(cc);
                                    Ha = true;
                                  });
                                }
                              },
                              hint: Text("الرياض",textAlign: TextAlign.center,style: TextStyle(
                                  color: Colors.black,fontFamily: 'jana'),),

                            ),
                            ),
                          ],),

                        ),
                        (Ha== false)?Container():Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
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
                            DropdownButtonHideUnderline(child:DropdownButton<String>(
                              value: _value2,
                              isExpanded: true,
                              // items: [
                              //   DropdownMenuItem<String>(
                              //     child: Text('قطن',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                              //     value: '1',
                              //   ),
                              //   DropdownMenuItem<String>(
                              //     child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                              //     value: '2',
                              //   ),
                              //   DropdownMenuItem<String>(
                              //     child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                              //     value: '3',
                              //   ),
                              // ],
                              items: ssss.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value,style: TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  int postion = D.indexOf(value);
                                  print("$value");
                                  _value2 = value;
                                  DicId =Dis[postion]['id'];
                                  // _isChose = true;
                                });
                              },
                              hint: Text("الرياض",textAlign: TextAlign.center,style: TextStyle(
                                  color: Colors.black,fontFamily: 'jana'),),

                            ),
                            ),
                          ],),

                        ),
                      ],),),
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
                        onTap: () async {
                          //print("Container clicked");
                          //Navigator.pop(context);
                          //await uploadmultipleimage(ImageFiles);
                          //String Res = await CreateOrder(ImageFiles,context) ;
                         // onBackPress(context,"$Res");
                         // print(Res);
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
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIndex();
    getAPI();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];

      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // Navigator.pushNamed(context, "chatScreen");
        // final notification = message['data'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => notification(),
          ),
        );
      },
      onResume: (Map<String, dynamic> message) async {
        // Navigator.pushNamed(context, "chatScreen");
        // print("onResume: $message");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => notification(),
          ),
        );
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }
  @override
  Widget build(BuildContext context) {
    CheckInternet(context);
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
          Container(height:size.height*0.25,decoration: BoxDecoration(
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

              Container(margin:EdgeInsets.all(5),child: Stack(children: [

                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    image: DecorationImage(
                      image: NetworkImage("$profileImage"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(children: [

                  Container(
                    width: 12.0,
                    height: 12.0,
                    decoration:
                    new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: Colors.green,
                      border: new Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),

                  ),
                ],),
              ],),),
              // Container(
              //   width: 45.0,
              //   height: 45.0,
              //   decoration: BoxDecoration(
              //     color: color1,
              //     //borderRadius: BorderRadius.all(Radius.circular(100.0)),
              //     image: DecorationImage(
              //       image: NetworkImage("https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Spacer(),




              SizedBox(width: 5,),
              IconButton(icon: Icon(Icons.notifications,color: color4,), onPressed: (){
                Navigator.pushNamed(context, "notification");
              }),
            ],),
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("أهلا بعودتك $username",style: TextStyle(color: Colors.white,fontFamily: 'Jana'),),
            ],),
            Row(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("كل الي تبغاه موجود هنا",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,fontFamily: 'Jana'),),
            ],)


          ],),)
          ),
          Container(margin:EdgeInsets.only(left: 20,right: 20),child: Column(children: [
            SizedBox(height: 10,),

           (C.isEmpty)?Container(margin: EdgeInsets.only(top: 10,  bottom: 20),padding:EdgeInsets.all(10),
              // height: size.height*0.45,
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
                RawMaterialButton(
                  onPressed: () {},
                  // elevation: 2.0,
                  fillColor: color1,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    //size: 35.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                // ClipOval(
                //   child: Material(
                //     color: Colors.blue, // button color
                //     child: InkWell(
                //       splashColor: Colors.red, // inkwell color
                //       child: SizedBox(width: 56, height: 56, child: Icon(Icons.menu)),
                //       onTap: () {},
                //     ),
                //   ),
                // ),
                Text("لا يوجد لديك طلبات", style: TextStyle(color: Colors.black,fontFamily: 'jana',
                    fontSize: 28,fontWeight: FontWeight.bold),),
                Text("إرسل طلبك الاول للحصول على عرض", style: TextStyle(color: Colors.grey,fontFamily: 'jana',
                    fontSize: 14,fontWeight: FontWeight.bold),),
              ],),
            ):ListView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemCount: C.length,
                itemBuilder: (BuildContext context, int index){
                  List<String> Img = new List();
                  List X = C[index]['vendors'];
                 // List Img=[];
                  Img.clear();
                  for(int i =0;i<X.length;i++){
                     Img.add(X[i]['image']);
                  }

                  return GestureDetector(onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => order_details(id: C[index]['id'],),
                        ));
                  },child:Container(margin: EdgeInsets.only(top: 10,  bottom: 20),padding:EdgeInsets.all(10),
                    //height: size.height*0.45,
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
                      Row(children: [
                        new RaisedButton(
                          onPressed: () async {

                          },
                          color: (C[index]['status_text']==2)?color6:color2,
                          child: new Row(
                            children: <Widget>[
                              new Text("${C[index]['status_text']}"+"   ",
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color:(C[index]['status_text']==2)?color3:  color1,
                                      fontFamily: 'jana'
                                  )),
                              new Icon(
                                Icons.flag,
                                color:(C[index]['status_text']==2)?color3: color1,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: new Row(
                            children: <Widget>[
                              new Text("${C[index]['created_at']}" + " ",
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color:  Colors.grey,
                                      fontFamily: 'jana'
                                  )),
                              new Icon(
                                Icons.access_alarm_rounded,
                                color: Colors.grey,
                              )
                            ],
                          ),),
                      ],),
                      Container(
                        width: 300,
                        child: Text(
                          "${C[index]['title']}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign:TextAlign.right,
                          style: TextStyle(fontFamily: 'jana',fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Text(
                          "${C[index]['description']}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign:TextAlign.right,
                          style: TextStyle(fontFamily: 'jana',color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(children: [
                        Expanded(flex: 2,child:Stack(children: [

                          Container(padding:EdgeInsets.only(left: 10,right: 10),width:130,height:35,decoration: BoxDecoration(
                            color: color4,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            ),
                          ),child: new Row(
                            children: <Widget>[

                            ],
                          ),),
                          Container(padding:EdgeInsets.only(left: 8,right: 8),width:100,height:35,decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            ),
                          ),child: new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.assignment_turned_in_outlined,
                                color: Colors.white,
                              ),
                              new Text("${C[index]['requests_count']} عرض",
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color:  Colors.white,
                                      fontFamily: 'jana'
                                  )),

                            ],
                          ),),
                        ],),),
                        Expanded(flex: 1,child: Container(margin:EdgeInsets.only(left: 8,right: 8),padding:EdgeInsets.only(left: 10,right: 10),width:60,height:35,decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          ),
                        ),child: new Row(
                          children: <Widget>[
                            new Text("${C[index]['rejected_requests_count']}"+" ",
                                style: new TextStyle(
                                    fontSize: 15,
                                    color:  color5,
                                    fontFamily: 'jana'
                                )),
                            new Icon(
                              Icons.message_sharp,
                              color: color5,
                            )
                          ],
                        ),),),
                        Expanded(flex: 1,child:Container(padding:EdgeInsets.only(left: 10,right: 10),width:60,height:35,decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          ),
                        ),child: new Row(
                          children: <Widget>[
                            new Text("${C[index]['valid_requests_count']}"+" ",
                                style: new TextStyle(
                                    fontSize: 15,
                                    color:  color5,
                                    fontFamily: 'jana'
                                )),
                            new Icon(
                              Icons.assignment_turned_in_outlined,
                              color: color5,
                            )
                          ],
                        ),),),


                      ],),
                      SizedBox(height: 5,),
                      Row(children: [

                        ImageStack(
                          imageList: Img,
                          imageRadius: 45, // Radius of each images
                          imageCount: 3,
                          totalCount: Img.length,// Maximum number of images to be shown in stack
                          imageBorderWidth: 3,
                          imageBorderColor: color1,
                          backgroundColor: color2,// Border width around the images
                        ),

                       // Text("خمس عروض جديده",style: TextStyle(fontFamily: 'jana'),),
                        Spacer(),
                        Text("${C[index]['price_from']} رس",style: TextStyle(fontFamily: 'jana',color: color3),),
                        SizedBox(width: 10,),
                        Text("الى",style: TextStyle(fontFamily: 'jana'),),
                        SizedBox(width: 10,),
                        Text("${C[index]['price_to']} رس",style: TextStyle(fontFamily: 'jana',color: color3),),
                      ],),
                    ],),
                  ),);
                }),
            Row(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("العروض المغلقه",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
            ],),
           // SizedBox(height: 10,),
            (done_orders.isEmpty)?Container(margin: EdgeInsets.only(top: 10,  bottom: 20),padding:EdgeInsets.all(10),
              // height: size.height*0.45,
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
                RawMaterialButton(
                  onPressed: () {},
                  // elevation: 2.0,
                  fillColor: color1,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    //size: 35.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                // ClipOval(
                //   child: Material(
                //     color: Colors.blue, // button color
                //     child: InkWell(
                //       splashColor: Colors.red, // inkwell color
                //       child: SizedBox(width: 56, height: 56, child: Icon(Icons.menu)),
                //       onTap: () {},
                //     ),
                //   ),
                // ),
                Text("لا يوجد لديك طلبات", style: TextStyle(color: Colors.black,fontFamily: 'jana',
                    fontSize: 28,fontWeight: FontWeight.bold),),
                Text("إرسل طلبك الاول للحصول على عرض", style: TextStyle(color: Colors.grey,fontFamily: 'jana',
                    fontSize: 14,fontWeight: FontWeight.bold),),
              ],),
            ):ListView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemCount: done_orders.length,
                itemBuilder: (BuildContext context, int index){


                  return Container(margin: EdgeInsets.only(   bottom: 20),
                    //height: size.height*0.30,
                    width: size.width*0.90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),

                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 5,
                      //     blurRadius: 7,
                      //     offset: Offset(0, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),
                    child: Column(children: [
                      Row(children: [
                        new RaisedButton(
                          onPressed: () async {

                          },
                          color: color6,
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.assignment_turned_in,
                                color: color3,
                              ),
                              new Text("  ${done_orders[index]['status_text']}",
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color:  color3,
                                      fontFamily: 'jana'
                                  )),

                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: new Row(
                            children: <Widget>[
                              new Text("${done_orders[index]['created_at']}" + " ",
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color:  Colors.grey,
                                      fontFamily: 'jana'
                                  )),
                              new Icon(
                                Icons.access_alarm_rounded,
                                color: Colors.grey,
                              )
                            ],
                          ),),
                      ],),
                      Container(
                        width: 300,
                        child: Text(
                          "${done_orders[index]['title']}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign:TextAlign.right,
                          style: TextStyle(fontFamily: 'jana',fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                      new RaisedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => order_details(id: done_orders[index]['id'],),
                              ));
                        },
                        color: color4,
                        child:  Text("تفاصيل الطلب",
                            style: new TextStyle(
                                fontSize: 15,
                                color:  color5,
                                fontFamily: 'jana'
                            )),
                      ),
                    ],),
                  );
                }),




          ],),),

        ],),)),),

    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("cleck flat");
          onButtonPressedfloat(context);
          //Navigator.pushNamed(context, "NewOrder");
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
  void getIndex() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    http.Response response = await http.get('https://amer.jit.sa/api/user/home',headers: { HttpHeaders.authorizationHeader: T,"Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    if(response.statusCode == 200){
      setState(() {
        C = map['data']['active_orders'];
        done_orders = map['data']['done_orders'];
      });
    }else if(response.statusCode == 401){
      sharedPrefs.remove('token');
      sharedPrefs.remove('UserType');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login_user(),
          ));
    }else{
      setState(() {
        C = [];
      });

    }


  }
  void getAPI() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get("https://amer.jit.sa/api/user/profile",headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
    if(response.statusCode == 200){
      Map map = json.decode(response.body);
      print(map);
      print(token);
      setState(() {
        Profile = map['data'];
        username = map['data']['username'];
        profileImage =  map['data']['image'];

      });
    }else if(response.statusCode == 401){
      sharedPrefs.remove('token');
      sharedPrefs.remove('UserType');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login_user(),
          ));
    }



  }


}
//262b39
//f6755f

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
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
  int _selectedIndex = 3;

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
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Home_user(),
                //     ));
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