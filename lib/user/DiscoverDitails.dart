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

class DiscoverDitails extends StatefulWidget {
  DiscoverDitails({this.url,this.title,this.type});
  final String url,title,type;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DiscoverDitailsStat();
  }
}

class DiscoverDitailsStat extends State<DiscoverDitails> {
  List more = [];
  List fa = [0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
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
                child: (more.isEmpty)?Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(color1),
                    )):Container(
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
                              "${widget.title}",
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
                                          padding: EdgeInsets.all(
                                            size.width * 0.02,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(5.0)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "${more[index]['image']}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          //margin: EdgeInsets.all(5),
                                          child: Stack(
                                            children: [
                                              // Align(alignment: Alignment.bottomRight,child: GestureDetector(onTap: (){
                                              //   print("hghgghghgh");
                                              //   setState(() {
                                              //     //(fa[index] == 1)?fa[index] = 0:fa[index] = 1;
                                              //   });
                                              // },child:Container(margin:EdgeInsets.all(5),child: Column(children: [
                                              //   Text("فلة في العارض",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.03,color: Colors.white,fontFamily: 'Jana'),),
                                              //   Text("477 رس",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.03,color: color1,fontFamily: 'Jana'),),
                                              // ],),)),),
                                              Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "${more[index]['title']}",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: size.width * 0.03,
                                                            color: Colors.white,
                                                            fontFamily: 'Jana'),
                                                      ),
                                                      Text(
                                                        "${more[index]['price']} رس",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: size.width * 0.03,
                                                            color: color1,
                                                            fontFamily: 'Jana'),
                                                      ),
                                                    ],
                                                  )),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      print("hghgghghgh");
                                                      String Res = await addFavorite(more[index]['id']);
                                                      if(Res != "success"){onBackPress(context,Res);}
                                                      setState(() {
                                                        (fa[index] == 1)
                                                            ? fa[index] = 0
                                                            : fa[index] = 1;
                                                      });

                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: (more[index]['is_favorite'] == true || fa[index] == 1)
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

                                              //],),
                                            ],
                                          ),
                                        )),
                                    onTap: () {});
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
      '${widget.url}',
      headers: {
    HttpHeaders.authorizationHeader: "$token","Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      more = map['data']['${widget.type}'];
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
