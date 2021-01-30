import 'dart:io';
import 'package:amr/Global.dart';
import 'package:amr/Screens/Results2.dart';
import 'package:amr/Screens/order_ditailsDiscovery.dart';
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
import 'UserOrder.dart';

class discover_userSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return discover_userSearchState();
  }
}

class discover_userSearchState extends State<discover_userSearch> {
  ScrollController _scrollController = ScrollController();
  String nextpage;
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


  @override
  Future<void> initState()  {
    // TODO: implement initState
    super.initState();
    getUserData();
    getmore('');
    _scrollController.addListener(() async {
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      String token = sharedPrefs.getString('token');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        if(nextpage != null){
          http.Response response = await http.get(nextpage,headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
          Map map = json.decode(response.body);
          List s = map['data']['offers'];
          setState(() {
            nextpage = map['data']['nextPageUrl'];
          });

          for(int i = 0 ; i < s.length ; i++){
            more.add(s[i]);
          }
          // setState(() {
          //   nextpage = map['data']['data']['next_page_url'];
          // });
        }
        print("$nextpage");
        print("sdsaddsadsdasadsadad");
      }
    });
    //getIndex();
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

                                      IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_outlined,
                                            color: color4,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
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
                                top: size.height * 0.15, ),
                            padding: EdgeInsets.all(10),
                            height: size.height * 0.10,
                            width: size.width * 0.90,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
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
                                      child:  TextField(
                                        onChanged: (text) {
                                          print("text $text");
                                         // more.clear();
                                          getmore(text);

                                        },
                                        autofocus: true,
                                        decoration: InputDecoration.collapsed(
                                          hintText: "إبحث عن كل ما تريده",
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontFamily: 'Jana'),
                                          border: InputBorder.none,
                                        ),
                                        maxLines: 1,
                                      )
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => Results2(),
                                          ),
                                        );
                                       // Navigator.pushNamed(context, "Results2");
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
                    (more == null)?Center(
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(color1),
                        )):(more.isEmpty)?Center(
                        child: Text("لا يوجد بيانات")):Container(padding: EdgeInsets.only(left: 15,right: 15,bottom: 20),height:MediaQuery.of(context).size.height*0.80,child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        //scrollDirection: Axis.horizontal,
                        itemCount: more.length,
                        itemBuilder: (BuildContext context, int index) {

                        return  GestureDetector(onTap: () async {
                          final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
                          if(sharedPrefs.getString('UserType') == 'مشتري'){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => details_price(id:more[index]['id'] ,),
                                ));
                          }else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => order_ditailsDiscovery(id:more[index]['id'] ,),
                                ));
                          }

                        },
                        child: Column(children: [
                          Row(
                            children: [
                              Text("${more[index]['price_from'].toString()}",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Jana',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              Text("  -  ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Jana',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              Text("${more[index]['price_to'].toString()}",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Jana',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ],
                          ),

                          Container(
                            width: size.width,
                            child: Text(
                              "${more[index]['title']}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign:TextAlign.right,
                              style: TextStyle(fontFamily: 'jana',fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(children: [
                            Container(
                              padding: EdgeInsets.only(left: 5,right: 5),
                              //width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: color1,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                              child:Text(
                                '${more[index]['sub_category']}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'jana',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            height: 2,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],),);
                      }),
                    ),

                  ],
                ),
              )),
        ),
      ),

    );
  }

  void getUserData() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      (sharedPrefs.getString('UserType') == 'مشتري')?'https://amer.jit.sa/api/user/profile':'https://amer.jit.sa/api/vendor/profile',
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
  void getmore(txt) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      (sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/search?sort_by=$F2sort_by&price_from=$F2priceFrom&price_to=$F2priceTo&category_id=$F2CatID&city_id=$F2CityID&text=$txt":"https://amer.jit.sa/api/vendor/search?sort_by=$F2sort_by&price_from=$F2priceFrom&price_to=$F2priceTo&category_id=$F2CatID&city_id=$F2CityID&text=$txt",
      headers: {
        HttpHeaders.authorizationHeader: "$token",
        "Accept": "application/json","Content-Type": "application/json"
      },
    );
    Map map = json.decode(response.body);
    print(map);
    print("https://amer.jit.sa/api/user/search?sort_by=$F2sort_by&price_from=$F2priceFrom&price_to=$F2priceTo&category_id=$F2CatID&city_id=$F2CityID&text=$txt");
    print(sharedPrefs.getString('UserType'));
    if(response.statusCode == 200){
      setState(() {
        // Profile = map['data'];
        more = map['data']['offers'];
        nextpage = map['data']['nextPageUrl'];

      });
    }else{
      more = null;
    }

   // onButtonPressed(context);
  }
}



//262b39
//f6755f

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}


