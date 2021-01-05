import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:amr/user/login_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amr/Screens/ChatScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../BNBCustompain.dart';

class settings extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return settingsState();
  }

}
class settingsState extends State<settings>{
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
  String imageProfilee='';
  void getAPI() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get((sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/profile":'https://amer.jit.sa/api/vendor/profile',headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
      imageProfilee = map['data']['image'];
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
                    image: NetworkImage("$imageProfilee"),
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
              Navigator.pushNamed(context, "Editpassword");
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
              print("Container clicked");
              SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
              sharedPrefs.remove('UserType');
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
             // Navigator.pushReplacementNamed(context, "Login");
              sharedPrefs.remove('UserType');
              String Res = await Logout('https://amer.jit.sa/api/vendor/logout');
              if(Res == "success"){
                sharedPrefs.remove('UserType');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login_user(),
                    ));
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
          Navigator.pushNamed(context, "NewOrder");
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
                Navigator.pushReplacementNamed(context, "Home");
              }else if(index == 2){
                Navigator.pushReplacementNamed(context, "discover");
              }else if(index == 1){
                Navigator.pushReplacementNamed(context, "messages");
              }else if(index == 0){
                Navigator.pushReplacementNamed(context, "settings");
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