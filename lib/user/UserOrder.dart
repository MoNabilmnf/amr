import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:amr/Global.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserOrderStat();
  }
}

class UserOrderStat extends State<UserOrder> {
  String _error = 'No Error Dectected';
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
  List col33 = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0, 0
  ];
  bool Ha = false;

  List<String> Cats = new List();
  List<String> City = new List();
  List<String> SubCat = new List();
  List<String> DDD = new List();
  int CatID, SubCatID;
  List Imagess = [];
  List S = [];
  List C = [];
  List SC = [];
  List Dis = [];
  int CityId, DicId;
  String CityName = 'المدينة';
  String DicName = 'الحي';
 // int SubCatId;
  String _value1, _value2;
  List name44 = ['شقق', 'أراضي', 'فلل'];
  List name_radio = [
    'النقل',
    'القيروان',
    'العارض',
    'الصحافة',
    'المروج',
    'المصيف',
    'النخيل'
  ];
  List name_radio22 = ['الرياض', 'القيروان', 'العارض', 'جده', 'مكه'];
  List name_radio2 = [
    'النقل',
    'القيروان',
    'العارض',
    'الصحافة',
    'المروج',
    'المصيف',
    'النخيل'
  ];
  List<Asset> imagess = List<Asset>();
  List<http.MultipartFile> multipart = List<http.MultipartFile>();
  List name33 = ['عقارات', 'سيارات', 'كماليات', 'تسوق', 'مشتريات'];
  int main = 2;
  List fa = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  List<Asset> imagesNew = List<Asset>();
  List ic33 = [
    Icons.home,
    Icons.directions_car,
    Icons.accessibility_new_rounded,
    Icons.shopping_cart,
    Icons.assignment
  ];
  List sh = [
    'https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg',
    'https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053668285faff42c99718.jpg',
    'https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053664315faff29f40e0b.jpg'
  ];
  List groupss = [0, 0, 0, 0, 0, 0, 0, 0];
  List<String> images = [
    "https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg",
    "https://www.caa.com/sites/default/files/styles/headshot_500x500/public/speaker-headshots/ParsonsJ_headshot_web.jpg?itok=iu-I0aZJ"
  ];
  final picker = ImagePicker();
  List<File> ImageFiles = [];
  List<File> _files;
  String _value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCity();
    getCat();
   // init();
  }

  @override
  Widget build(BuildContext context) {
    CheckInternet(context);
    // TODO: implement build
    return Container(
        child: StatefulBuilder(// You need this, notice the parameters below:
            builder: (BuildContext context, StateSetter setState) {
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
          child: Container(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "إنشاء طلب جديد",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Jana'),
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "عينات لما تحتاجه",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: 'Jana'),
                        ),
                      ],
                    ),




                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              loadAssets();
                             // getImageFiles();
                              //getImage();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 1, left: 10),
                              child: DottedBorder(
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
                                        width: 1, style: BorderStyle.none),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  width: 100,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.cloud_upload,
                                        color: Colors.grey,
                                      ),
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
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex:2,child: imagesNew == null
                            ? Text('')
                            :Container(
                          height: 100.0,
                          child: GridView.count(
                            // padding: EdgeInsets.all(10),
                            crossAxisCount:3,
                            children: List.generate(imagesNew.length, (index) {
                              Asset asset = imagesNew[index];

                              return Container(
                                margin: EdgeInsets.only(left: 10),
                                child:AssetThumb(
                                  asset: asset,
                                  width: 300,
                                  height: 300,
                                ),
                              );
                            }),
                          ),
                        ),),
                        // Expanded(
                        //   flex: 2,
                        //   child: ImageFiles == null
                        //       ? Text('')
                        //       : Container(
                        //           height: 100.0,
                        //           child: ListView.builder(
                        //             shrinkWrap: true,
                        //             scrollDirection: Axis.horizontal,
                        //             itemCount: ImageFiles.length,
                        //             itemBuilder:
                        //                 (BuildContext context, int index) {
                        //               return new InkWell(
                        //                   onTap: () {},
                        //                   child: Center(
                        //                     child: Container(
                        //                       margin: EdgeInsets.only(left: 10),
                        //                       decoration: BoxDecoration(
                        //                         color: Colors.grey[300],
                        //                         borderRadius: BorderRadius.only(
                        //                             topLeft:
                        //                                 Radius.circular(10),
                        //                             topRight:
                        //                                 Radius.circular(10),
                        //                             bottomLeft:
                        //                                 Radius.circular(10),
                        //                             bottomRight:
                        //                                 Radius.circular(10)),
                        //                       ),
                        //                       width: 100,
                        //                       child: Column(
                        //                         mainAxisAlignment:
                        //                             MainAxisAlignment.center,
                        //                         children: <Widget>[
                        //                           // Icon(Icons.location_on_outlined,color: Colors.white,),
                        //                           // Text(
                        //                           //   'الأراضي',
                        //                           //   style: TextStyle(
                        //                           //     color: Colors.white,
                        //                           //     fontFamily: 'jana',
                        //                           //     fontSize: 14,
                        //                           //   ),
                        //                           // ),
                        //
                        //                           Image.file(ImageFiles[index]),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ));
                        //             },
                        //           ),
                        //         ),
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "عنوان الطلب",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: 'Jana'),
                        ),
                      ],
                    ),
                    Container(
                      height: 70,
                      child: TextField(
                        controller: _controller3,
                        keyboardType: TextInputType.text,
                        maxLength: 50,
                        maxLines: 2,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "jana",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText:
                              'أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
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
                    Row(
                      children: [
                        Text(
                          "وصف قصير",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: 'Jana'),
                        ),
                      ],
                    ),
                    Container(
                      height: 70,
                      child: TextField(
                        controller: _controller4,
                        keyboardType: TextInputType.text,
                        maxLength: 50,
                        maxLines: 2,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "jana",
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText:
                              'السلام عليكم أبحث عن شقه في شمال الرياض سكن ثلاث أفراد طلاب جامعيين و يكون سعرها مناسب لمدة تقريباً أربع سنوات أو أكثر',
                          hintStyle: TextStyle(
                              fontFamily: 'jana',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "تصنيفات و كلمات مفتاحية",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: 'Jana'),
                        ),
                      ],
                    ),
                    Container(
                      height: size.height * 0.20,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: S.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new InkWell(
                              onTap: () {
                                setState(() {
                                  col33 = [
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0
                                  ];
                                  fa = [
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                  ];
                                  col33[index] = 1;
                                  SubCatID = 0;
                                  CatID = S[index]['id'];
                                  getSubCat(S[index]['id']);
                                });
                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: (col33[index] == 0)
                                          ? Colors.grey[300]
                                          : color2,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      border: (col33[index] == 1)
                                          ? Border.all(color: color1)
                                          : null),
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.network(
                                        "${S[index]['icon']}",
                                        color: (col33[index] == 0)
                                            ? Colors.grey
                                            : color1,
                                        height: 50,
                                        width: 50,
                                      ),
                                      //Icon(ic33[index],color: (col33[index] == 0)?Colors.grey:color1,),
                                      Text(
                                        "${S[index]['title']}",
                                        //textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: (col33[index] == 0)
                                              ? Colors.grey
                                              : color1,
                                          fontFamily: 'jana',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    (SC.isEmpty)
                        ? Container()
                        : Row(
                            children: [
                              Container(
                                height: size.height * 0.05,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: SC.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return new InkWell(
                                        onTap: () {
                                          setState(() {
                                            fa = [
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                            ];
                                            fa[index] = 1;
                                            SubCatID = SC[index]['id'];
                                          });
                                        },
                                        child: Center(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                                color: (fa[index] == 0)
                                                    ? Colors.grey[300]
                                                    : color2,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5)),
                                                border: (fa[index] == 1)
                                                    ? Border.all(color: color1)
                                                    : null),
                                            width: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                //Icon(ic33[index],color: (col33[index] == 0)?Colors.grey:color1,),
                                                Text(
                                                  SC[index]['title'],
                                                  style: TextStyle(
                                                    color: (fa[index] == 0)
                                                        ? Colors.grey
                                                        : color1,
                                                    fontFamily: 'jana',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "الموقع",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: 'Jana'),
                        ),
                      ],
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.40,
                            // height: size.height * 0.12,
                            padding: EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                            ),
                            child: Column(
                              children: [
                                // Row(
                                //   children: [
                                //     Text('المدينة',
                                //         style: TextStyle(
                                //             fontSize: 12.0,
                                //             fontFamily: 'jana',
                                //             color: Colors.grey)),
                                //   ],
                                // ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
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
                                        child: new Text(value,
                                            style:
                                                TextStyle(color: Colors.black)),
                                      );
                                    }).toList(),
                                    onChanged: (String value) async {
                                      setState(() {
                                        int postion = City.indexOf(value);
                                        print("$value");
                                        _value1 = value;
                                        CityId = C[postion]['id'];
                                        DDD.clear();
                                        DicId = 0;
                                        getDic(CityId);
                                        // _isChose = true;
                                      });
                                      // ssss = await getDic(CityId);
                                      // if(D.isNotEmpty){
                                      //   setState(()  {
                                      //     print("$ssss");
                                      //     //D.addAll(ssss);
                                      //     // Dis.addAll(cc);
                                      //     Ha = true;
                                      //   });
                                      // }
                                    },
                                    hint: Text(
                                      "المدينة",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // (DDD.isEmpty)
                          //     ? Container()
                          //     :
                          Container(
                                  width: size.width * 0.40,
                                 // height: size.height * 0.12,
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  child: Column(
                                    children: [
                                      // Row(
                                      //   children: [
                                      //     Text('الحي',
                                      //         style: TextStyle(
                                      //             fontSize: 12.0,
                                      //             fontFamily: 'jana',
                                      //             color: Colors.grey)),
                                      //   ],
                                      // ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
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
                                          items: DDD.map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(value,
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            );
                                          }).toList(),
                                          onChanged: (String value) {
                                            setState(() {
                                              int postion = DDD.indexOf(value);
                                              print("$value");
                                              _value2 = value;
                                              DicId = Dis[postion]['id'];
                                              // _isChose = true;
                                            });
                                          },
                                          hint: Text(
                                            "الحي",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "الميزانية المتاحة",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: 'Jana'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          color: Colors.grey[300],
                          height: 45,
                          width: size.width * 0.40,
                          child: TextField(
//            maxLength: 40,
                            textAlign: TextAlign.center,
                            controller: _controller1,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: Colors.white38,
                              hintText: '3500 \$',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.all(8),
                          color: Colors.grey[300],
                          height: 45,
                          width: size.width * 0.40,
                          child: TextField(
//            maxLength: 40,
                            textAlign: TextAlign.center,
                            controller: _controller2,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: Colors.white38,
                              hintText: '5000 \$',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (imagesNew.isEmpty) {
                              onBackPress(context, "أختر صورة");
                            } else
                              if (_controller3.text.isEmpty) {
                              onBackPress(context, "أضف عنوان للطلب");
                            } else if (_controller4.text.isEmpty) {
                              onBackPress(
                                  context, "أضف وصف للطلب");
                            } else if (CatID == null) {
                              onBackPress(context, "أختر تصنيفا");
                            }else if (SubCatID == null) {
                              onBackPress(context, "أختر تصنيفا فرعيا");
                            } else if (CityId == null) {
                              onBackPress(context, "أختر مدينة");
                            }else if (DicId == 0) {
                              onBackPress(context, "أختر حي");
                            } else if (_controller1.text.isEmpty || _controller2.text.isEmpty) {
                              onBackPress(context, "الميزانية المتاحه فارغه");
                            }else if (int.parse(_controller1.text.trim()) > int.parse(_controller2.text.trim())) {
                              onBackPress(context, "المبلغ المبدئي أقل من المبلغ النهائي");
                            } else {
                                CheckInternet(context);
                                _onLoadingLogin(context);

                            }
                            //print("Container clicked");
                            //Navigator.pop(context);
                            //await uploadmultipleimage(ImageFiles);

                            // onBackPress(context,"$Res");
                            // print(Res);
                            //Navigator.pushNamed(context, "NewOrder2");
                          },
                          child: Container(
                            width: size.width * 0.80,
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                              color: color1,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "نشر الطلب",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jana',
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: size.height * 0.06,
                                  width: size.height * 0.06,
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  child: Icon(
                                    Icons.upload_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                )),
          )));
    }));
  }
  Future<List<Asset>> selectImagesFromGallery() async {
    return await MultiImagePicker.pickImages(
      maxImages: 65536,
      enableCamera: true,
      materialOptions: MaterialOptions(
        actionBarColor: "#FF147cfa",
        statusBarColor: "#FF147cfa",
      ),
    );
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> init() async {
    /// uri can be of android scheme content or file
    /// for iOS PHAsset identifier is supported as well

    List<Asset> assets = await loadAssets();
    List<File> files = [];
    for (Asset asset in assets) {
      final filePath =
      await FlutterAbsolutePath.getAbsolutePath(asset.identifier);
      files.add(File(filePath));
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _files = files;
    });
  }
  void getCity() async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/cities',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      C = map['data']['cities'];
      for (int i = 0; i < C.length; i++) {
        City.add(C[i]['title']);
      }
      //City = map['data']['cities'];
    });
  }

  void getCat() async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/categories',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      S = map['data']['categories'];
      for (int i = 0; i < S.length; i++) {
        Cats.add(S[i]['title']);
      }
    });
  }
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(imagess.length, (index) {
        Asset asset = imagess[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  Future loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: imagesNew,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#f6755f",
          actionBarTitle: "عامر",
          allViewTitle: "جميع الصور",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      imagesNew = resultList;

      _error = error;
    });
    return resultList;
    // for (int i = 0; i < imagess.length; i++) {
    //   var path = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
    //   multipart.add(await MultipartFile.fromFile(path, filename: 'myfile.jpg'));
    // }
  }
  void getDic(id) async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/cities/$id',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      Dis = map['data']['cities'];
      for (int i = 0; i < Dis.length; i++) {
        DDD.add(Dis[i]['title']);
      }
    });

    //onButtonPressedfloat(context);
  }

  void getSubCat(id) async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/categories/$id',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      SC = map['data']['categories'];
      for (int i = 0; i < SC.length; i++) {
        SubCat.add(SC[i]['title']);
      }
      //City = map['data']['cities'];
    });
  }
  void _onLoadingLogin(context) {
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
    new Future.delayed(new Duration(seconds: 1), () async {
      String Res = await CreateOrderTest(imagesNew, context,CatID,SubCatID,_controller3.text,_controller4.text,CityId,DicId,_controller1.text,_controller2.text);
      if(Res == 'Success'){
        Navigator.pop(context);
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "تم أضافة الطلب",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: color1,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        Navigator.pop(context);
        print(Res.toString());
      }
    });

  }
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
