import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:amr/BNBCustompain.dart';

import 'order_ditails.dart';

class HomeAS extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeASState();
  }

}
class HomeASState extends State<HomeAS>{
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Color color3 = colorFromHex("#0acb83");
  Color color4 = colorFromHex("#ececec");
  Color color5 = colorFromHex("##848484");
  Color color6 = colorFromHex("##e6faf2");
  Color color7 = colorFromHex("#242a38");

  int main = 1;
  List<String> images = ["https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg", "https://www.caa.com/sites/default/files/styles/headshot_500x500/public/speaker-headshots/ParsonsJ_headshot_web.jpg?itok=iu-I0aZJ"];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
    body: Directionality(
      textDirection: TextDirection.rtl,
      child:
      //Stack(children: [

        Container(child:SingleChildScrollView(scrollDirection: Axis.vertical,child:Container(child: Column(children: [
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


              Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: color1,
                  //borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  image: DecorationImage(
                    image: NetworkImage("https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
                    fit: BoxFit.cover,
                  ),
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
                    image: NetworkImage("https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 5,),
              IconButton(icon: Icon(Icons.notifications,color: color4,), onPressed: (){
                Navigator.pushNamed(context, "notification");
              }),
            ],),
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("أهلا بعودتك مكتب الهدف العقاري",style: TextStyle(color: Colors.white,fontFamily: 'Jana'),),
            ],),
            Row(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("جميع عروضنا هنا",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,fontFamily: 'Jana'),),
            ],)


          ],),)
          ),
          Container(margin:EdgeInsets.only(left: 20,right: 20),child: Column(children: [
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("عروضك",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
            ],),
            GestureDetector(onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => order_details(),
                  ));
            },child:Container(margin: EdgeInsets.only(top: 10,  bottom: 20),padding:EdgeInsets.all(10),
              height: size.height*0.45,
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
                    color: color2,
                    child: new Row(
                      children: <Widget>[
                        new Text("قائم"+"   ",
                            style: new TextStyle(
                                fontSize: 15,
                                color:  color1,
                                fontFamily: 'jana'
                            )),
                        new Icon(
                          Icons.flag,
                          color: color1,
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: new Row(
                      children: <Widget>[
                        new Text("منذ 5 دقائق" + " ",
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
                    "أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign:TextAlign.right,
                    style: TextStyle(fontFamily: 'jana',fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    "أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
                        new Text("33 عرض",
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
                      new Text("4"+" ",
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
                      new Text("33"+" ",
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
                    imageList: images,
                    imageRadius: 45, // Radius of each images
                    imageCount: 3,
                    totalCount: 4,// Maximum number of images to be shown in stack
                    imageBorderWidth: 3,
                    imageBorderColor: color1,
                    backgroundColor: color2,// Border width around the images
                  ),
                  SizedBox(width: 5,),
                  Text("خمس عروض جديده",style: TextStyle(fontFamily: 'jana'),),
                  Spacer(),
                  Text("4337 رس",style: TextStyle(fontFamily: 'jana',color: color3),),
                ],),
              ],),
            ),),

            Row(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("العروض المغلقه",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,fontFamily: 'Jana'),),
            ],),
            SizedBox(height: 10,),
            Container(margin: EdgeInsets.only( top: 10,  bottom: 20),
              height: size.height*0.30,
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
                        new Text("  تم قبول العرض",
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
                        new Text("منذ 5 دقائق" + " ",
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
                    "أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign:TextAlign.right,
                    style: TextStyle(fontFamily: 'jana',fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
                new RaisedButton(
                  onPressed: () async {

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
            ),
            SizedBox(height: 40,)
          ],),),

        ],),)),),

        // Expanded(
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child:  Container(child:
        //     // Stack(children: [
        //
        //     Positioned(left: 0,bottom: 0,child: Container(width: size.width,height: 70,child: Stack(children: [
        //       CustomPaint(size: Size(size.width,70),painter: BNBCustompain(),),
        //       Center(heightFactor: 0.1,child: FloatingActionButton(onPressed: (){
        //
        //       },backgroundColor: color1,child: Icon(Icons.add,size: 35,),elevation: 0.1,),),
        //       Container(margin:EdgeInsets.only(top: 8),height:50,child:
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
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
        //           Container(width: size.width*0.20,),
        //
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
        //
        //
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

      //],),
    ),
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