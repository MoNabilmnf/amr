import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../BNBCustompain.dart';


class chatScreen extends StatefulWidget{
  int selectedID;


  chatScreen({this.selectedID});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return chatScreenState();
  }

}
class chatScreenState extends State<chatScreen>{
  Color color1 = colorFromHex("f6755f");
  List Chat = new List();

  final TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // title: Center(child:Text('${widget.bill_code}'),),
        title: Center(child:Column(children: [
          Text('مكتب الهدف العقاري',style: TextStyle(
              color: Colors.black,
              fontFamily: 'jana'
          ,fontWeight: FontWeight.bold,fontSize: 14),),
          Text('متصل الأن',style: TextStyle(
              color: Colors.black,
              fontFamily: 'jana',fontSize: 10,fontWeight: FontWeight.bold
          ),),
        ],)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        ],
      ),

      //body: Container(child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(color:Colors.white,child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [

        new Flexible(
          child: Container(margin:EdgeInsets.all(20),child: new ListView(
            //controller: _scrollController,
            reverse: true,
            shrinkWrap: true,
            // children: _getChildren(Chat),
            children: [
              Container(padding:EdgeInsets.only(top: 10),child:Row(children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .75),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.only(
                      //topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "السلام عليكم كيفك اخي الكريم ؟ ان شاء الله تكون بخير",
                    style: Theme.of(context).textTheme.body1.apply(
                      color: Colors.white,
                        fontFamily: 'jana'
                    ),
                  ),
                ),
                Spacer(),
                Column(children: [
                  Icon(MaterialIcons.done_all,color: color1,),
                  Text('9:44',style: TextStyle(color: Colors.black),),
                ],),
              ],) ,),
              Container(padding:EdgeInsets.only(top: 10),child:Row(children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .75),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.only(
                      //topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                  "بدي استفسر عن تفاصيل شقة بشمال الرياض كم اجمالي المساحه و هل السعر قابل للتفاوض ام لا",
                  style: Theme.of(context).textTheme.body1.apply(
                      color: Colors.white,
                      fontFamily: 'jana'
                  ),
                ),
                ),
                Spacer(),
                Column(children: [
                  Icon(MaterialIcons.done_all,color: color1,),
                  Text('9:44',style: TextStyle(color: Colors.black),),
                ],),
              ],) ,),
              Container(padding:EdgeInsets.only(bottom: 10),child:Row(mainAxisAlignment:MainAxisAlignment.end,children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .75),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      //topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "السلام عليكم كيفك اخي الكريم ؟ ان شاء الله تكون بخير",
                    style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.black,
                        fontFamily: 'jana'
                    ),
                  ),
                ),

              ],) ,),
              Container(padding:EdgeInsets.only(bottom: 10),child:Row(mainAxisAlignment:MainAxisAlignment.end,children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .75),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      //topLeft: Radius.circular(10),
                    ),
                  ),
                  child:  Text(
                    "بدي استفسر عن تفاصيل شقة بشمال الرياض كم اجمالي المساحه و هل السعر قابل للتفاوض ام لا",
                    style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.black,
                        fontFamily: 'jana'
                    ),
                  ),
                ),

              ],) ,),
            ],
          ),),

        ),
        Container(alignment:Alignment.bottomCenter,margin:EdgeInsets.all(8),height: 45,child:TextField(
//            maxLength: 40,
          controller: _controller,
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(fontSize: 14.0, color: Colors.grey),
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.black12,
            hintText: 'أكتب رساله',
            hintStyle: TextStyle(color: Colors.grey),
            //prefixIcon: Icon(Icons.search),
            suffixIcon: InkWell(
              onTap: () async {

              },
              child: Icon(Icons.send),
            ),
            contentPadding: const EdgeInsets.only(
              left: 8.0,
              bottom: 8.0,
              top: 8.0,
              right: 8.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        ),),
      ],),),
        // Column(children: [
        //   SizedBox(height: 10),
        //   Row(
        //     children: [
        //       // MyCircleAvatar(
        //       //   imgUrl: messages[i]['contactImgUrl'],
        //       // ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           // Text(
        //           //   "client",
        //           //   style: Theme.of(context).textTheme.caption,
        //           // ),
        //           Container(
        //             constraints: BoxConstraints(
        //                 maxWidth: MediaQuery.of(context).size.width * .6),
        //             padding: const EdgeInsets.all(15.0),
        //             decoration: BoxDecoration(
        //               color: Color(primaryColor),
        //               borderRadius: BorderRadius.only(
        //                 topRight: Radius.circular(25),
        //                 bottomLeft: Radius.circular(25),
        //                 //bottomRight: Radius.circular(25),
        //                 topLeft: Radius.circular(25),
        //               ),
        //             ),
        //             child: Text(
        //               "messageasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasasas",
        //               style: Theme.of(context).textTheme.body1.apply(
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(width: 15),
        //       Text(
        //         "time",
        //         style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
        //       ),
        //     ],
        //   ),
        //   SizedBox(height: 10),
        //   Row(mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       // MyCircleAvatar(
        //       //   imgUrl: messages[i]['contactImgUrl'],
        //       // ),
        //
        //       Text(
        //         "time",
        //         style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
        //       ),
        //       SizedBox(width: 15),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           // Text(
        //           //   "client",
        //           //   style: Theme.of(context).textTheme.caption,
        //           // ),
        //           Container(
        //             constraints: BoxConstraints(
        //                 maxWidth: MediaQuery.of(context).size.width * .6),
        //             padding: const EdgeInsets.all(15.0),
        //             decoration: BoxDecoration(
        //               color: Colors.black26,
        //               borderRadius: BorderRadius.only(
        //                 topRight: Radius.circular(25),
        //                 //bottomLeft: Radius.circular(25),
        //                 bottomRight: Radius.circular(25),
        //                 topLeft: Radius.circular(25),
        //               ),
        //             ),
        //             child: Text(
        //               "messagewawaawasdsaddddddddddddddddddddddddddddddas asddddddd asdasd xfsd",
        //               style: Theme.of(context).textTheme.body1.apply(
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //
        //     ],
        //   ),
        // ],),),
      ),);
  }
  List<dynamic> _getChildren(List list) {
    List<Widget> children = [];

    for (int i = 0; i < list.length; i++) {
      String time = list[i]['created_at'];
      children.add(
        Container(
          margin: EdgeInsets.only(bottom: 20,),
          child: ButtonTheme(
            height: 40,
            minWidth: double.infinity,
            child: (list[i]['store_id'] == null)?Row(
              children: [
                // MyCircleAvatar(
                //   imgUrl: messages[i]['contactImgUrl'],
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "client",
                    //   style: Theme.of(context).textTheme.caption,
                    // ),
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .6),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF005b2c),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          //bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        "${list[i]['message']}",
                        style: Theme.of(context).textTheme.body1.apply(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Text(
                  time.substring(11),
                  style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
                ),
              ],
            ):Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // MyCircleAvatar(
                //   imgUrl: messages[i]['contactImgUrl'],
                // ),

                Text(
                  time.substring(11),
                  style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text(
                    //   "client",
                    //   style: Theme.of(context).textTheme.caption,
                    // ),
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .6),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          //bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        "${list[i]['message']}",
                        style: Theme.of(context).textTheme.body1.apply(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      );
    }

    return children;
  }



}