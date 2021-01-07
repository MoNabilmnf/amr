import 'dart:io';
import 'package:amr/Global.dart';
import 'package:amr/user/DiscoverDitailsVendores.dart';
import 'package:amr/user/details_price.dart';
import 'package:amr/user/profile.dart';
import 'package:amr/user/settings_user.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:amr/user/Home_user.dart';
import 'package:amr/user/messages_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:image_stack/image_stack.dart';
import 'package:amr/BNBCustompain.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'DiscoverDitails.dart';

class discover_user extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return discover_userState();
  }
}

class discover_userState extends State<discover_user> {
  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller3 = new TextEditingController();
  final TextEditingController _controller4 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  int CatId =1;
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Color color3 = colorFromHex("#0acb83");
  Color color4 = colorFromHex("#ececec");
  Color color5 = colorFromHex("#848484");
  Color color6 = colorFromHex("#e6faf2");
  Color color7 = colorFromHex("#242a38");
  List name = ['عقارات', 'سيارات', 'كماليات'];
  List ra = [3.5, 2.5, 4.0];
  List fa = [0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  List name_radio22 = ['الرياض', 'القيروان', 'العارض', 'جده', 'مكه'];
  List name2 = ['تميز للسيارات', 'Unique Store', 'الهدف العقاري'];
  List name3 = ['قصر فخم للبيع', 'شقة تمليك', 'شقة ايجار'];
  List price = ['10000 رس', '2000 رس', '260 رس'];
  List name4 = ['سياره هيونداي', 'سياره موديل 2008', 'سياره ايجار'];
  List price2 = ['30000 رس', '20000 رس', '260 رس'];
  List Cars = [
    'https://mostaql.hsoubcdn.com/uploads/563692-uwdvc-1563922230-5d378f36cc4e7.jpg',
    'https://www.definicionabc.com/wp-content/uploads/tecnologia/App-Store.jpg',
    'https://mostaql.hsoubcdn.com/uploads/376214-F9cqf-1521055150-Untitled-1.png'
  ];
  List sh = [
    'https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/15950985605f1345c0b80a0.jpg',
    'https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053668285faff42c99718.jpg',
    'https://sakeny-production.s3.us-east-1.amazonaws.com/uploads/adds/16053664315faff29f40e0b.jpg'
  ];
  List ic = [Icons.home, Icons.directions_car, Icons.accessibility_new_rounded];
  List col = ["#f6755f", "#4b2095", "#0acb83"];
  List col2 = ["#FEF2EF", "#e6e1ef", "#e6faf2"];
  List ic33 = [
    Icons.home,
    Icons.directions_car,
    Icons.accessibility_new_rounded,
    Icons.shopping_cart,
    Icons.assignment
  ];
  List col33 = [0, 1, 0, 0, 0];
  List categories = [];
  List featured_vendors = [];
  List featured_offers = [];
  List categories_with_offers = [];
  List title = [];
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
  List name_radio2 = [
    'النقل',
    'القيروان',
    'العارض',
    'الصحافة',
    'المروج',
    'المصيف',
    'النخيل'
  ];
  List more = [];
  List name33 = ['عقارات', 'سيارات', 'كماليات', 'تسوق', 'مشتريات'];
  List Cars2 = [
    "https://dubarter.s3-eu-west-1.amazonaws.com/2018/06/large-2565629033866609074.jpg",
    "https://dubarter.s3-eu-west-1.amazonaws.com/2018/06/large-1993033583095106736.jpg",
    "https://dubarter.s3-eu-west-1.amazonaws.com/2018/06/large-1577744743291838940.jpg"
  ];
  int main = 2;
  bool is_favorite = false;
  List groupss = [0, 0, 0, 0, 0, 0, 0, 0];
  String username = '', imageProfile = '';
  String _myActivity, _value;
  List<String> images = [
    "https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg",
    "https://www.caa.com/sites/default/files/styles/headshot_500x500/public/speaker-headshots/ParsonsJ_headshot_web.jpg?itok=iu-I0aZJ"
  ];
  final picker = ImagePicker();
  List<File> ImageFiles = [];

  void onButtonPressedV(context,url,title,type) {
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
            child: DiscoverDitails(url: url,title: title,type: type,),
          );
        });
  }

  Widget BigListViewWidgetV() {
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      final Size size = MediaQuery.of(context).size;
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    "المتجات",
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
                      "منتجات مميزه",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Jana'),
                    ),
                  ],
                ),
                new Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(8, (index) {
                        return GestureDetector(
                            child: Card(
                                color: Colors.white,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Container(
                                            width: size.width * 0.12,
                                            height: size.width * 0.12,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://scontent.fcai21-2.fna.fbcdn.net/v/t1.0-9/51708364_2011415955560256_2886851547768029184_n.png?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=XXH_wJpZkCMAX_2I_lK&_nc_ht=scontent.fcai21-2.fna&oh=e6373af721ca662ba01095d81441fec6&oe=5FD942F4"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: size.width * 0.12,
                                            height: size.width * 0.12,
                                            decoration: BoxDecoration(
                                              color: color2,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "4.9",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.orange,
                                                      fontFamily: 'Jana'),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellowAccent,
                                                      size: 12,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellowAccent,
                                                      size: 12,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellowAccent,
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        "مكتب الهدف العقاري",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontFamily: 'Jana'),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: color1,
                                            size: size.width * 0.04,
                                          ),
                                          Text(
                                            "المملكة العربية السعودية",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.02,
                                                color: color1,
                                                fontFamily: 'Jana'),
                                          ),
                                        ],
                                      ),
                                      //SizedBox(height: 5,),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Container(
                                        child: Text(
                                          "مكتب متخصص في عقارات شمال الرياض",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'jana',
                                              fontSize: size.width * 0.03,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => profile(),
                                  ));
                            });
                      }),
                    )),
              ],
            )),
      );
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
            child: DiscoverDitailsVendores(id: CatId,),
          );
        });
  }

  Widget BigListViewWidget() {
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      final Size size = MediaQuery.of(context).size;
      return Directionality(
        textDirection: TextDirection.rtl,
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    "البائعين",
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
                      "العقار",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Jana'),
                    ),
                  ],
                ),
                new Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(8, (index) {
                    return GestureDetector(
                        child: Card(
                            color: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Container(
                                        width: size.width * 0.12,
                                        height: size.width * 0.12,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.0)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://scontent.fcai21-2.fna.fbcdn.net/v/t1.0-9/51708364_2011415955560256_2886851547768029184_n.png?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=XXH_wJpZkCMAX_2I_lK&_nc_ht=scontent.fcai21-2.fna&oh=e6373af721ca662ba01095d81441fec6&oe=5FD942F4"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: size.width * 0.12,
                                        height: size.width * 0.12,
                                        decoration: BoxDecoration(
                                          color: color2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              "4.9",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.orange,
                                                  fontFamily: 'Jana'),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellowAccent,
                                                  size: 12,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellowAccent,
                                                  size: 12,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellowAccent,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "مكتب الهدف العقاري",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.03,
                                        color: Colors.black,
                                        fontFamily: 'Jana'),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: color1,
                                        size: size.width * 0.04,
                                      ),
                                      Text(
                                        "المملكة العربية السعودية",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.02,
                                            color: color1,
                                            fontFamily: 'Jana'),
                                      ),
                                    ],
                                  ),
                                  //SizedBox(height: 5,),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    child: Text(
                                      "مكتب متخصص في عقارات شمال الرياض",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'jana',
                                          fontSize: size.width * 0.03,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => profile(),
                              ));
                        });
                  }),
                )),
              ],
            ))),
      );
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
      List groups = [
        'asdsd',
        'القيروان',
        'asa',
        'الصحافة',
        'المروج',
      ];

      return StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        final Size size = MediaQuery.of(context).size;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'المدينة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Jana'),
                      ),
                    ],
                  ),
                  new Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Row(
                          children: <Widget>[
                            Text("    "),
                            Text(
                              name_radio[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Jana'),
                            ),
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
                    ),
                  ),
                ],
              )),
        );
      });
    }

    Widget BigListViewWidgetEEE() {
      String groub;
      List groups = [
        'asdsd',
        'القيروان',
        'asa',
        'الصحافة',
        'المروج',
      ];

      return StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        final Size size = MediaQuery.of(context).size;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'المدينة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Jana'),
                      ),
                    ],
                  ),
                  new Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: name_radio22.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Row(
                          children: <Widget>[
                            Text("    "),
                            Text(
                              name_radio22[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Jana'),
                            ),
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
                    ),
                  ),
                ],
              )),
        );
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
                              getImageFiles();
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
                        Expanded(
                          flex: 2,
                          child: ImageFiles == null
                              ? Text('')
                              : Container(
                                  height: 100.0,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: ImageFiles.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return new InkWell(
                                          onTap: () {},
                                          child: Center(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              width: 100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                            ),
                                          ));
                                    },
                                  ),
                                ),
                        ),
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
                            color: Colors.grey,
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
                      height: size.height * 0.15,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return new InkWell(
                              onTap: () {
                                setState(() {
                                  col33 = [0, 0, 0, 0, 0];
                                  col33[index] = 1;
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
                                      Icon(
                                        ic33[index],
                                        color: (col33[index] == 0)
                                            ? Colors.grey
                                            : color1,
                                      ),
                                      Text(
                                        name33[index],
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
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.05,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return new InkWell(
                                  onTap: () {
                                    setState(() {
                                      fa = [
                                        0,
                                        0,
                                        0,
                                      ];
                                      fa[index] = 1;
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
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
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
                                            name44[index],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('bess');
                            onButtonPressedEEE(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.40,
                                height: size.height * 0.12,
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
                                    Row(
                                      children: [
                                        Text('المدينة',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontFamily: 'jana',
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('bess');
                                      },
                                      child: Row(
                                        children: [
                                          Text('قطن',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'jana',
                                                  color: Colors.black)),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('bess');
                            onButtonPressedEE(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.40,
                                height: size.height * 0.12,
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
                                    Row(
                                      children: [
                                        Text('الحي',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontFamily: 'jana',
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('bess');
                                      },
                                      child: Row(
                                        children: [
                                          Text('الحي',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'jana',
                                                  color: Colors.black)),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                          onTap: () {
                            print("Container clicked");
                            Navigator.pop(context);
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
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    getIndex();
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
            // Stack(children: [

            Container(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: size.height * 0.20,
                            decoration: BoxDecoration(
                              color: color1,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  bottomRight: Radius.circular(22)),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 5,
                              //     blurRadius: 7,
                              //     offset: Offset(0, 3), // changes position of shadow
                              //   ),
                              // ],
                            ),
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 30, right: 20, left: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100.0)),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    (imageProfile.isEmpty)?"https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png":"$imageProfile"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: new BoxDecoration(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10.0),
                                                    color: Colors.green,
                                                    border: new Border.all(
                                                      color: Colors.white,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 25.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: color1,
                                          // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.notifications,
                                            color: color4,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "notification");
                                          }),
                                    ],
                                  ),

                                  //SizedBox(height: 5,),
                                ],
                              ),
                            )),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: size.height * 0.15, bottom: 20),
                            padding: EdgeInsets.all(10),
                            height: size.height * 0.10,
                            width: size.width * 0.90,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: new GestureDetector(
                                    onTap: () {
                                      showSearch(
                                          context: context,
                                          delegate: DataSearch());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      height: size.height * 0.08,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: Colors.grey,
                                          ),
                                          Text("    "),
                                          Text(
                                            "إبحث عن كل ما تريده",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                                fontFamily: 'Jana'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: size.height * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.tune,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        //Navigator.pushNamed(context, "Results");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 100.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new InkWell(
                            onTap: () {
                              setState(() {
                                CatId=categories[index]['id'];
                              });
                              featured_vendors.clear();
                              featured_offers.clear();
                              categories_with_offers.clear();
                              getFilter(categories[index]['id']);
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: colorFromHex(
                                    "${categories[index]['bg_color']}"),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Image.network(
                                        "${categories[index]['icon']}",
                                        color: colorFromHex(
                                            "${categories[index]['text_color']}"),
                                        height: 30,
                                        width: 30,
                                      ),
                                      //Icon(ic[index],color: colorFromHex("${col[index]}"),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        // categories[index]['title'],
                                        //maxLines: 2,
                                        "${categories[index]['title']}".length >
                                                13
                                            ? '${"${categories[index]['title']}".substring(0, 13)}'
                                            : "${categories[index]['title']}",
                                        style: TextStyle(
                                            color: colorFromHex(
                                                "${categories[index]['text_color']}"),
                                            fontFamily: 'jana',
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    (featured_vendors.isEmpty)?Container():Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "بائعين الاسبوع",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Jana'),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              onButtonPressed(context);
                            //  onButtonPressedV(context,'https://amer.jit.sa/api/user/explore/featured-offers/$CatId','بائعين الاسبوع','featured_vendors');
                              //more.clear();
                             // getmore('https://amer.jit.sa/api/user/explore/featured-offers/1');

                            },
                            child: Text(
                              "عرض الكل",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontFamily: 'Jana'),
                            ),
                          ),
                          Text(
                            "  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Jana'),
                          ),
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.grey,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    (featured_vendors.isEmpty)?Container():Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 160.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: featured_vendors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => profile(id: featured_vendors[index]['id'],),
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.0)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${featured_vendors[index]['image']}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                      Text(
                                        featured_vendors[index]['username'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'jana',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  //   ],
                                  // ),
                                  StarRating(
                                    color: Colors.yellow,
                                    starCount: 5,
                                    rating: double.parse(featured_vendors[index]['rate']),
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    (featured_offers.isEmpty)?Container():Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "منتجات متميزه",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Jana'),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {

                              //more.clear();
                             // getmore('https://amer.jit.sa/api/user/explore/featured-offers/1');
                              onButtonPressedV(context,'https://amer.jit.sa/api/user/explore/featured-offers/$CatId','منتجات متميزه','featured_vendors');
                            },
                            child: Text(
                              "عرض الكل",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontFamily: 'Jana'),
                            ),
                          ),
                          Text(
                            "  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Jana'),
                          ),
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.grey,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    (featured_offers.isEmpty)?Container():Container(
                      //margin:EdgeInsets.only(left: 20,right: 20),
                      height: 180.0,
                      child:
                      ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: featured_offers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new InkWell(
                            onTap: () {
                              print("asdasdname");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => details_price(id:featured_offers[index]['id'] ,),
                                  ));
                            },
                            child: Container(
                              // alignment: Alignment.centerRight,
                              // padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              //width: 120,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${featured_offers[index]['image']}"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: GestureDetector(
                                            onTap: () async {
                                              print("hghgghghgh");
                                              String Res = await addFavorite(featured_offers[index]['id']);
                                              if(Res != "success"){onBackPress(context,Res);}
                                              setState(() {
                                                (fa[index] == 1)
                                                    ? fa[index] = 0
                                                    : fa[index] = 1;
                                              });

                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(5),
                                              child: (featured_offers[index]['is_favorite'] == true || fa[index] == 1)
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )
                                                  : Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.grey,
                                                    ),
                                            )),
                                      ),
                                    ],
                                  ),

                                  //Align(alignment: Alignment.topRight,child:  ),
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            featured_offers[index]['title'],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'jana',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            featured_offers[index]['price'],
                                            style: TextStyle(
                                                color: color1,
                                                fontFamily: 'jana',
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    (categories_with_offers.isEmpty)?Container(): ListView.builder(
                        shrinkWrap: true,
                        //scrollDirection: Axis.horizontal,
                        //controller: _scrollController,
                        itemCount: categories_with_offers.length,
                        itemBuilder: (BuildContext context, int index) {

                           List titlessss = categories_with_offers[index]['offers'];


                          return Column(children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${categories_with_offers[index]['title']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Jana'),
                                  ),
                                  Spacer(),
                              GestureDetector(
                                onTap: () {

                                  //more.clear();
                                  // getmore('https://amer.jit.sa/api/user/explore/featured-offers/1');
                                  onButtonPressedV(context,'https://amer.jit.sa/api/user/explore/category-offers/${categories_with_offers[index]['id']}',categories_with_offers[index]['title'],'offers');
                                },
                                child:Text(
                                    "عرض الكل",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: 'Jana'),
                                  ),),
                                  Text(
                                    "  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: 'Jana'),
                                  ),
                                  Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                            (titlessss == null)?Container():Container(
                              //margin:EdgeInsets.only(left: 20,right: 20),
                              height: 180.0,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: titlessss.length,
                                itemBuilder: (BuildContext context, int i) {
                                  return new InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => details_price(id:featured_offers[index]['id'] ,),
                                          ));
                                    },
                                    child: Container(
                                      // alignment: Alignment.centerRight,
                                      // padding: EdgeInsets.all(12),
                                      margin: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      //width: 120,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 100.0,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              image: DecorationImage(
                                                image: NetworkImage("${titlessss[i]['image']}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          //Align(alignment: Alignment.topRight,child:  ),
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    titlessss[i]['title'],
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: 'jana',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    titlessss[i]['price'],
                                                    style: TextStyle(
                                                        color: color1,
                                                        fontFamily: 'jana',
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],);
                        }),

                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, "NewOrder");
          onButtonPressedfloat(context);
          print("cleck flat");
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
  List<dynamic> _getChildrenEX(vals) {
    List<Widget> children = [];
    for (int i = 0; i < vals.length; i++) {
      children.add(
        Container(
          //margin:EdgeInsets.only(left: 20,right: 20),
          height: 180.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: vals.length,
            itemBuilder: (BuildContext context, int i) {
              return new InkWell(
                onTap: () {},
                child: Container(
                  // alignment: Alignment.centerRight,
                  // padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  //width: 120,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.0)),
                          image: DecorationImage(
                            image: NetworkImage("${vals[i]['image']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //Align(alignment: Alignment.topRight,child:  ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Text(
                                vals[i]['title'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'jana',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                vals[i]['price'],
                                style: TextStyle(
                                    color: color1,
                                    fontFamily: 'jana',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return children;
  }
  void getUserData() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      'https://amer.jit.sa/api/user/profile',
      headers: {
        HttpHeaders.authorizationHeader: "$token",
        "Accept": "application/json"
      },
    );
    Map map = json.decode(response.body);
    print("user usr $map");
    print(token);
    setState(() {
      // Profile = map['data'];
      username = map['data']['username'];
      imageProfile = map['data']['image'];
    });
  }
  void getFilter(ID) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      "https://amer.jit.sa/api/user/explore/category/$ID",
      headers: {
        HttpHeaders.authorizationHeader: "$token",
        "Accept": "application/json"
      },
    );
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
      // Profile = map['data'];
      featured_vendors = map['data']['featured_vendors'];
      featured_offers = map['data']['featured_offers'];
      categories_with_offers = map['data']['categories_with_offers'];
    });
  }
  void getIndex() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      "https://amer.jit.sa/api/user/explore/index",
      headers: {
        HttpHeaders.authorizationHeader: "$token",
        "Accept": "application/json"
      },
    );
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
      // Profile = map['data'];
      categories = map['data']['categories'];
      featured_vendors = map['data']['featured_vendors'];
      featured_offers = map['data']['featured_offers'];
      categories_with_offers = map['data']['categories_with_offers'];
    });
  }
  addFavorite(order_id) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    var body = {
      "order_id":"$order_id"
    };
    http.Response response = await http.post("https://amer.jit.sa/api/user/order/favorite",body: body,headers: {HttpHeaders.authorizationHeader:  T, "Accept":"application/json"});
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if(response.statusCode == 200){
      return 'success';
    }else{
      return '${responsebody['data']['message']}';
    }
  }
  void getmore(url) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      "$url",
      headers: {
        HttpHeaders.authorizationHeader: "$token",
        "Accept": "application/json"
      },
    );
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
      // Profile = map['data'];
      more = map['data']['featured_vendors'];

    });
   // onButtonPressed(context);
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
  int _selectedIndex = 2;

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
              if (index == 3) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_user(),
                    ));
              } else if (index == 2) {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => discover_user(),
                //     ));
              } else if (index == 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => messages_user(),
                    ));
              } else if (index == 0) {
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
                  style: TextStyle(
                    color: color,
                    fontFamily: 'Jana',
                  ),
                )
              ],
            ),
          ),
        ),
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

class DataSearch extends SearchDelegate<String> {
  final citic = [
    'شقه في شمال الرياض تبعد عن وادي الحياه بحوالي 650 متر فقط',
    'فيلا في الرياض 2 دور + حمام سباحة + الفيلا تطل على اسفارة الامريكية'
  ];
  final citics = ['1000 \$', '40000 \$'];
  final citics2 = ['شقة', 'فيلا'];
  Color color1 = colorFromHex("f6755f");

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
            //print(l);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
//    vendor="unV";
//    vendorID=l[index]['id'].toString();
//    Navigator.pushNamed(context, "Vendor");
    print("ali");
    return Container(
      child: Center(
        child: Text(
          query,
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? citic
        : citic.where((p) => p.startsWith(query)).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(8),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("${citics[index]}",
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Jana',
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
                RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'jana',
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                            text: suggestionList[index].substring(query.length),
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'jana',
                              fontSize: 16,
                            ))
                      ]),
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${citics2[index]}',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'jana',
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        itemCount: suggestionList.length,
      ),
    );
  }
}
