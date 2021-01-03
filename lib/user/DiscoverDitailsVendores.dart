import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:amr/Global.dart';
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

class DiscoverDitailsVendores extends StatefulWidget {
  DiscoverDitailsVendores({this.id});
  //final String url,title,type;
  int id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DiscoverDitailsVendoresStat();
  }
}

class DiscoverDitailsVendoresStat extends State<DiscoverDitailsVendores> {
  List more = [];
  Color color2 = colorFromHex("#FEF2EF");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getall();
    //getCat();
  }
  Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: StatefulBuilder(// You need this, notice the parameters below:
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
                              "البائعين",
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
                              children: List.generate(more.length, (index) {
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
                                                            "${more[index]['image']}"),
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
                                                          "${more[index]['rate']}",
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
                                                "${more[index]['username']}",
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
                                      // Navigator.pop(context);
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => profile(),
                                      //     ));
                                    });
                              }),
                            )),
                      ],
                    )),
              );
            }));
  }

  void getall() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');

    http.Response response = await http.get(
      'https://amer.jit.sa/api/user/explore/featured-vendors/',
      headers: {
    HttpHeaders.authorizationHeader: "$token","Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      more = map['data']['featured_vendors'];
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

    });
  }

  void getDic(id) async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/cities/$id',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {

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

    });
  }
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
