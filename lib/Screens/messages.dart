import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amr/Screens/ChatScreen.dart';

import '../BNBCustompain.dart';

class messages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return messagesState();
  }

}
class messagesState extends State<messages>{
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Color color3 = colorFromHex("#0acb83");
  Color color4 = colorFromHex("#ececec");
  Color color5 = colorFromHex("##848484");
  Color color6 = colorFromHex("##e6faf2");
  Color color7 = colorFromHex("#242a38");
  int main = 3;
  List<String> mtime = [ "9:20 م",'20/3/2020','الثلاثاء',"9:20 م",'20/3/2020',"9:20 م","9:20 م",'20/3/2020','الثلاثاء','الثلاثاء',];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        leading:Icon(Icons.arrow_back,color:Colors.white ,),

        title: Center(child: Text(
          'الرسائل',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'jana'
          ),
        ),),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Colors.white,
             // borderRadius: BorderRadius.all(Radius.circular(100.0)),
              image: DecorationImage(
                image: NetworkImage("https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Container(margin:EdgeInsets.all(5),child: Stack(children: [
          //
          //   Container(
          //     width: 40.0,
          //     height: 40.0,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(100.0)),
          //       image: DecorationImage(
          //         image: NetworkImage("https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          //   Column(children: [
          //
          //     Container(
          //       width: 12.0,
          //       height: 12.0,
          //       decoration:
          //       new BoxDecoration(
          //         borderRadius: new BorderRadius.circular(10.0),
          //         color: Colors.green,
          //         border: new Border.all(
          //           color: Colors.white,
          //           width: 2.0,
          //         ),
          //       ),
          //
          //     ),
          //   ],),
          // ],),),


        ],
      ),
      body:Column(children: [
        Expanded(
          child: ListView.separated(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                //final Message chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => chatScreen(),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      children: <Widget>[


                        //SizedBox(width: 5,),
                        Expanded(flex: 5,child: Column(children: [

                          Row(children: [
                            Expanded(flex: 2,child: Container(
                              width: 300,
                              child: Text(
                                mtime[index],
                                // overflow: TextOverflow.ellipsis,
                                //   maxLines: 2,
                                // textAlign:TextAlign.right,
                                style: TextStyle(fontFamily: 'jana',fontSize: 12,fontWeight: FontWeight.bold),
                              ),
                            ),),
                            Expanded(flex: 4,child: Container(
                              width: 300,
                              child: Text(
                                "أحمد محمد حسن",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign:TextAlign.right,
                                style: TextStyle(fontFamily: 'jana',fontSize: 14,fontWeight: FontWeight.bold),
                              ),
                            ),),

                          ],),
                          Container(
                            width: 300,
                            child: Text(
                              "أالسلام عليكم مرحبا بك اخي الكريم شكرا لك",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign:TextAlign.right,
                              style: TextStyle(fontFamily: 'jana',fontSize: 12,color:Colors.grey ),
                            ),
                          ),
                        ],)),
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
                        Expanded(flex: 1,child: Stack(children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              image: DecorationImage(
                                image: NetworkImage("https://www.hklaw.com/-/media/images/professionals/p/parsons-kenneth-w/newphoto/parsons-kenneth-w.jpg"),
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
                  ),

                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),),
        // Expanded(flex: 1,
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
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "NewOrder");
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
  int _selectedIndex = 1;

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