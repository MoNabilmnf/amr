import 'dart:io';

import 'package:amr/Screens/order_ditails.dart';
import 'package:amr/user/details_price.dart';
import 'package:amr/user/profile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../BNBCustompain.dart';
import 'OrderDetails_Vendor.dart';
import 'order_ditailsDiscovery.dart';

class notification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return notificationState();
  }

}
class notificationState extends State<notification>{
  ScrollController _scrollController = ScrollController();
  String nextpage;
  String username = '', imageProfile = '';
  List notifications;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //final notification = message['notification'];
        notifications.clear();
        getnot();
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        // setState(() {
        //   messages.add(Message(
        //     title: '${notification['title']}',
        //     body: '${notification['body']}',
        //   ));
        // });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    getnot();
    getUserData();
    _scrollController.addListener(() async {
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      String token = sharedPrefs.getString('token');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        if(nextpage != null){
          http.Response response = await http.get(nextpage,headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
          Map map = json.decode(response.body);
          List s = map['data']['notifications'];
          setState(() {
            nextpage = map['data']['nextPageUrl'];
          });

          for(int i = 0 ; i < s.length ; i++){
            notifications.add(s[i]);
          }
          // setState(() {
          //   nextpage = map['data']['data']['next_page_url'];
          // });
        }
        print("$nextpage");
        print("sdsaddsadsdasadsadad");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(child: Text(
          'الإشعارات',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'jana'
          ),
        ),),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(margin:EdgeInsets.all(5),child: Stack(children: [

            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                image: DecorationImage(
                  image: NetworkImage((imageProfile.isEmpty)?"https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png":"$imageProfile"),
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
          

        ],
      ),
      body: (notifications == null)?Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(colorFromHex("f6755f")),
          )):(notifications.isEmpty)?Center(child: Text("لا يوجد إشعارات"),):
      ListView.separated(
        itemCount: notifications.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          //final Message chat = chats[index];
          return GestureDetector(
            onTap: () async {
              final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
              if(sharedPrefs.getString('UserType') == 'مشتري'){
                if(notifications[index]['type'] == "order"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => order_details(id: notifications[index]['destination'],),
                    ),
                  );
                }else if(notifications[index]['type'] == "vendor"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => profile(id: notifications[index]['destination'],),
                    ),
                  );
                }else if(notifications[index]['type'] == "offer"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => details_price(id: notifications[index]['destination'],),
                    ),
                  );
                }
              }else{
                if(notifications[index]['type'] == "order"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => order_ditailsDiscovery(id: notifications[index]['destination'],),
                    ),
                  );
                }else if(notifications[index]['type'] == "vendor"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => profile(id: notifications[index]['destination'],),
                    ),
                  );
                }else if(notifications[index]['type'] == "offer"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => order_details_vendor(id: notifications[index]['destination'],),
                    ),
                  );
                }
              }


            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(flex: 1,child: Container(
                    width: 300,
                    child: Text(
                      "${notifications[index]['created_at']}",
                      // overflow: TextOverflow.ellipsis,
                      //   maxLines: 2,
                      // textAlign:TextAlign.right,
                      style: TextStyle(fontFamily: 'jana',fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),),
                  SizedBox(width: 5,),
                  Expanded(flex: 4,child: Container(
                    width: 300,
                    child: Text(
                      "${notifications[index]['text']}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign:TextAlign.right,
                      style: TextStyle(fontFamily: 'jana',fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                  ),),
                  SizedBox(width: 5,),
                  // Expanded(flex: 1,child: Container(
                  //   width: 50.0,
                  //   height: 50.0,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  //     image: DecorationImage(
                  //       image: NetworkImage("http://kilimanjarotrekkingguides.co.uk/uploads/package/801568621938.jpg"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),),
                ],
              ),
            ),

          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
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
  void getnot() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get(
      (sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/notifications":"https://amer.jit.sa/api/vendor/notifications",
      headers: {
        HttpHeaders.authorizationHeader: "$token",
        "Accept": "application/json"
      },
    );
    Map map = json.decode(response.body);
    print(sharedPrefs.getString('UserType'));
    print(map);
    print(token);
    setState(() {
      notifications = map['data']['notifications'];
      nextpage = map['data']['nextPageUrl'];
    });
  }
}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}