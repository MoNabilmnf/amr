import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return notificationState();
  }

}
class notificationState extends State<notification>{
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
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          //final Message chat = chats[index];
          return GestureDetector(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => ChatScreen(
            //       user: chat.sender,
            //     ),
            //   ),
            // ),
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
                      "الثلاثاء",
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
                      "أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign:TextAlign.right,
                      style: TextStyle(fontFamily: 'jana',fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                  ),),
                  SizedBox(width: 5,),
                  Expanded(flex: 1,child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      image: DecorationImage(
                        image: NetworkImage("http://kilimanjarotrekkingguides.co.uk/uploads/package/801568621938.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),),
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

}