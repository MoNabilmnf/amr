import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import '../BNBCustompain.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Global.dart';

class ChatScreenFack extends StatefulWidget{
  int selectedID;
  String image,Name;


  ChatScreenFack({this.selectedID,this.image,this.Name});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatScreenFackState();
  }

}
class ChatScreenFackState extends State<ChatScreenFack>{
  Color color1 = colorFromHex("f6755f");
  List Chat = new List();
  File _image;
  final picker = ImagePicker();
  ScrollController _scrollController = ScrollController();
  String nextpage;
  String username = '';
  String userID = '';
  String UserType = '';
  int receiverId ;
  String imageProfile = '';
  String RoomId = '';
  final TextEditingController _controller = new TextEditingController();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getmessages();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        if(RoomId.isNotEmpty){
          Chat.clear();
          getmessages(RoomId);
        }

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
   // getUserData();
    _scrollController.addListener(() async {
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      String token = sharedPrefs.getString('token');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        if(nextpage != null){
          http.Response response = await http.get(nextpage,headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
          Map map = json.decode(response.body);
          List s = map['data']['messages'];
          setState(() {
            nextpage = map['data']['nextPageUrl'];
          });

          for(int i = 0 ; i < s.length ; i++){
            Chat.add(s[i]);
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
      appBar: AppBar(
        // title: Center(child:Text('${widget.bill_code}'),),
        title: Center(child:Column(children: [
          Text((widget.Name.isEmpty)?'':'${widget.Name}',style: TextStyle(
              color: Colors.black,
              fontFamily: 'jana'
          ,fontWeight: FontWeight.bold,fontSize: 14),),
          // Text('متصل الأن',style: TextStyle(
          //     color: Colors.black,
          //     fontFamily: 'jana',fontSize: 10,fontWeight: FontWeight.bold
          // ),),
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
                image: NetworkImage((widget.image.isEmpty)?"https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png":"${widget.image}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),

      //body: Container(child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [

      body: Directionality(
        textDirection: TextDirection.rtl,
        child:  Column(mainAxisAlignment: MainAxisAlignment.end,children: [
        new Expanded(
          child:ListView.builder(
            itemCount: Chat.length,
            controller: _scrollController,
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              //final Message chat = chats[index];
              if(UserType == "مشتري"){
                if(Chat[index]['owner'] == 'user'){
                  return  Container(padding:EdgeInsets.only(top: 10),child:Row(children: [
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
                      child: (Chat[index]['message_type'] == "file")?Container(
                        //margin: EdgeInsets.all(5),
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          image: DecorationImage(
                            image: NetworkImage("${Chat[index]['message']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )

                          :Text(
                        "${Chat[index]['message']}",
                        style: Theme.of(context).textTheme.body1.apply(
                            color: Colors.white,
                            fontFamily: 'jana'
                        ),
                      ),
                    ),
                  //  Spacer(),
                  //  Column(children: [
                  //    Icon(MaterialIcons.done_all,color: color1,),
                   //   Text('${Chat[index]['created_at']}',style: TextStyle(color: Colors.black),),
                   // ],),
                  ],) ,);
                }else{
                  return Container(padding:EdgeInsets.only(bottom: 10),child:Row(mainAxisAlignment:MainAxisAlignment.end,children: [
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
                      child:(Chat[index]['message_type'] == "file")?Container(
                        //margin: EdgeInsets.all(5),
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          image: DecorationImage(
                            image: NetworkImage("${Chat[index]['message']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )


                          : Text(
                        "${Chat[index]['message']}",
                        style: Theme.of(context).textTheme.body1.apply(
                            color: Colors.black,
                            fontFamily: 'jana'
                        ),
                      ),
                    ),

                  ],) ,);
                }

              }else{
                if(Chat[index]['owner'] == 'vendor'){
                  return  Container(padding:EdgeInsets.only(top: 10),child:Row(children: [
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
                      child:(Chat[index]['message_type'] == "file")?

                      Container(
                       // margin: EdgeInsets.all(5),
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          image: DecorationImage(
                            image: NetworkImage("${Chat[index]['message']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                          :

                      Text(
                        "${Chat[index]['message']}",
                        style: Theme.of(context).textTheme.body1.apply(
                            color: Colors.white,
                            fontFamily: 'jana'
                        ),
                      ),
                    ),
                  //  Spacer(),
                  //  Column(children: [
                  //    Icon(MaterialIcons.done_all,color: color1,),
                  //    Text('${Chat[index]['created_at']}',style: TextStyle(color: Colors.black),),
                    //],),
                  ],) ,);
                }else{
                  return Container(padding:EdgeInsets.only(bottom: 10),child:Row(mainAxisAlignment:MainAxisAlignment.end,children: [
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
                      child:(Chat[index]['message_type'] == "file")?Container(
                        //margin: EdgeInsets.all(5),
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          image: DecorationImage(
                            image: NetworkImage("${Chat[index]['message']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )

                          : Text(
                        "${Chat[index]['message']}",
                        style: Theme.of(context).textTheme.body1.apply(
                            color: Colors.black,
                            fontFamily: 'jana'
                        ),
                      ),
                    ),

                  ],) ,);
                }

              }

            },

          ),),

        // new Flexible(
        //   child: Container(margin:EdgeInsets.all(20),child: new ListView(
        //     //controller: _scrollController,
        //     reverse: true,
        //     shrinkWrap: true,
        //     // children: _getChildren(Chat),
        //     children: [
        //       Container(padding:EdgeInsets.only(top: 10),child:Row(children: [
        //         Container(
        //           constraints: BoxConstraints(
        //               maxWidth: MediaQuery.of(context).size.width * .75),
        //           padding: const EdgeInsets.all(15.0),
        //           decoration: BoxDecoration(
        //             color: color1,
        //             borderRadius: BorderRadius.only(
        //               //topRight: Radius.circular(25),
        //               bottomLeft: Radius.circular(10),
        //               bottomRight: Radius.circular(10),
        //               topLeft: Radius.circular(10),
        //             ),
        //           ),
        //           child: Text(
        //             "السلام عليكم كيفك اخي الكريم ؟ ان شاء الله تكون بخير",
        //             style: Theme.of(context).textTheme.body1.apply(
        //               color: Colors.white,
        //                 fontFamily: 'jana'
        //             ),
        //           ),
        //         ),
        //         Spacer(),
        //         Column(children: [
        //           Icon(MaterialIcons.done_all,color: color1,),
        //           Text('9:44',style: TextStyle(color: Colors.black),),
        //         ],),
        //       ],) ,),
        //       Container(padding:EdgeInsets.only(top: 10),child:Row(children: [
        //         Container(
        //           constraints: BoxConstraints(
        //               maxWidth: MediaQuery.of(context).size.width * .75),
        //           padding: const EdgeInsets.all(15.0),
        //           decoration: BoxDecoration(
        //             color: color1,
        //             borderRadius: BorderRadius.only(
        //               //topRight: Radius.circular(25),
        //               bottomLeft: Radius.circular(10),
        //               bottomRight: Radius.circular(10),
        //               topLeft: Radius.circular(10),
        //             ),
        //           ),
        //           child: Text(
        //           "بدي استفسر عن تفاصيل شقة بشمال الرياض كم اجمالي المساحه و هل السعر قابل للتفاوض ام لا",
        //           style: Theme.of(context).textTheme.body1.apply(
        //               color: Colors.white,
        //               fontFamily: 'jana'
        //           ),
        //         ),
        //         ),
        //         Spacer(),
        //         Column(children: [
        //           Icon(MaterialIcons.done_all,color: color1,),
        //           Text('9:44',style: TextStyle(color: Colors.black),),
        //         ],),
        //       ],) ,),
        //       Container(padding:EdgeInsets.only(bottom: 10),child:Row(mainAxisAlignment:MainAxisAlignment.end,children: [
        //         Container(
        //           constraints: BoxConstraints(
        //               maxWidth: MediaQuery.of(context).size.width * .75),
        //           padding: const EdgeInsets.all(15.0),
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.only(
        //               topRight: Radius.circular(10),
        //               bottomLeft: Radius.circular(10),
        //               bottomRight: Radius.circular(10),
        //               //topLeft: Radius.circular(10),
        //             ),
        //           ),
        //           child: Text(
        //             "السلام عليكم كيفك اخي الكريم ؟ ان شاء الله تكون بخير",
        //             style: Theme.of(context).textTheme.body1.apply(
        //                 color: Colors.black,
        //                 fontFamily: 'jana'
        //             ),
        //           ),
        //         ),
        //
        //       ],) ,),
        //       Container(padding:EdgeInsets.only(bottom: 10),child:Row(mainAxisAlignment:MainAxisAlignment.end,children: [
        //         Container(
        //           constraints: BoxConstraints(
        //               maxWidth: MediaQuery.of(context).size.width * .75),
        //           padding: const EdgeInsets.all(15.0),
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.only(
        //               topRight: Radius.circular(10),
        //               bottomLeft: Radius.circular(10),
        //               bottomRight: Radius.circular(10),
        //               //topLeft: Radius.circular(10),
        //             ),
        //           ),
        //           child:  Text(
        //             "بدي استفسر عن تفاصيل شقة بشمال الرياض كم اجمالي المساحه و هل السعر قابل للتفاوض ام لا",
        //             style: Theme.of(context).textTheme.body1.apply(
        //                 color: Colors.black,
        //                 fontFamily: 'jana'
        //             ),
        //           ),
        //         ),
        //
        //       ],) ,),
        //     ],
        //   ),),
        //
        // ),
        Container(alignment:Alignment.bottomCenter,margin:EdgeInsets.all(8),height: 45,child:
        Row(children: [
          Expanded(flex:9,child: TextField(
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
                  if(_controller.text.isNotEmpty){
                    String Res = await AddMessage(_controller.text);
                    if(Res == 'success'){
                      _controller.clear();
                    }else{
                      onBackPress(context,Res);
                    }
                  }

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
          Expanded(flex:1,child: InkWell(
            onTap: () async {
              getImageFiles();

            },
            child: Icon(Icons.image,color: color1,),
          ),),

        ],),

        ),
      ],),
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

  AddMessage(message) async {
    var d;
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if((sharedPrefs.getString('UserType') == 'مشتري')){
      d ={
        "vendor_id":"${widget.selectedID}",
        "message_type":"text",
        "message":"$message"
      };
    }else{
      d ={
        "user_id":"${widget.selectedID}",
        "message_type":"text",
        "message":"$message"
      };
    }

    print(d.toString());

    String token = sharedPrefs.getString('token');
    http.Response response = await http.post((sharedPrefs.getString('UserType') == 'مشتري')?'https://amer.jit.sa/api/user/message/send':'https://amer.jit.sa/api/vendor/message/send', body: d,
        headers: {HttpHeaders.authorizationHeader:"$token",
          "Accept": "application/json",
        });
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if (response.statusCode == 200) {
      Chat.clear();
      getmessages(responsebody['data']['room_id']);
      setState(() {
        RoomId = responsebody['data']['room_id'].toString();
      });
      return 'success';
    } else {
      print(response.statusCode.toString());
      return responsebody['data'];
    }
  }
  Future getImageFiles() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() async {
      if (pickedFile != null) {
        // ImageFiles.add(File(pickedFile.path));
        setState(() {
          _image = File(pickedFile.path);

        });
       String Res = await ChatImageFack(context,_image,widget.selectedID);
       if(Res != "failer"){
         Chat.clear();
         getmessages(Res);
         setState(() {
           RoomId = Res;
         });
         //print("sadsadata $Res");
       }
      // print("sadsadata $Res");
        //Chat.clear();
        //getmessages("2");
        // if(Res == "Success"){
        //   Chat.clear();
        //   getmessages();
        //   print("Res is $Res");
        // }else{
        //   print("Res is $Res");
        // }
      } else {
        print('No image selected.');
      }
    });
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
      imageProfile = map['data']['image'];
      userID = map['data']['id'];
    });
  }
  void getmessages(id) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    //(sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/rooms/roomMessages/1":
    http.Response response = await http.get(
      (sharedPrefs.getString('UserType') == 'مشتري')?'https://amer.jit.sa/api/user/rooms/roomMessages/$id':"https://amer.jit.sa/api/vendor/rooms/roomMessages/$id",
      headers: {
        HttpHeaders.authorizationHeader: "$token",
        "Accept": "application/json"
      },
    );
    Map map = json.decode(response.body);
    print(sharedPrefs.getString('UserType'));
    print(map);
    setState(() {
      UserType = sharedPrefs.getString('UserType');
      Chat = map['data']['messages'];
      username = map['data']['receiverName'];
      imageProfile = map['data']['receiverImage'];
      receiverId = map['data']['receiverId'];
      nextpage = map['data']['nextPageUrl'];
    });
  }




}