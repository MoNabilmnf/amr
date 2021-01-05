//send_your_order
import 'dart:io';
import 'package:amr/APIs/Api.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amr/Screens/ChatScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../BNBCustompain.dart';
import 'Home.dart';

class send_your_order extends StatefulWidget{
  send_your_order({this.id});
  final int id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return send_your_orderState();
  }

}
class send_your_orderState extends State<send_your_order>{
  final TextEditingController _controller2 = new TextEditingController();
  Color color1 = colorFromHex("f6755f");
  Color color2 = colorFromHex("#FEF2EF");
  Color color3 = colorFromHex("#0acb83");
  Color color4 = colorFromHex("#ececec");
  Color color5 = colorFromHex("##848484");
  Color color6 = colorFromHex("##e6faf2");
  Color color7 = colorFromHex("#242a38");
  int main = 4;
  final TextEditingController _controller3 = new TextEditingController();
  bool saturday = false;
  bool saturday2 = false;
  String imageProfile = '';
  List<Asset> images = List<Asset>();
  List<MultipartFile> multipart = List<MultipartFile>();
  Asset ss ;
  String _error = 'No Error Dectected';
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

      body:Directionality(
        textDirection: TextDirection.rtl,
        child:SingleChildScrollView(scrollDirection: Axis.vertical,child:Container(child:Column(children: [
        Container(margin: EdgeInsets.only(top: 30,bottom: 20,right: 20),child: Column(children: [
          Row(children: [
            Stack(children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  image: DecorationImage(
                    image: NetworkImage("$imageProfile"),
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
            Spacer(),
            Text(
              'إرسل عرض',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontSize: 20,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),

          ],),
          SizedBox(height: 20,),
          Row(children: [
            Text("وصف العرض",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
          ],),

          Container(height:70,child: TextField(
            controller: _controller3,
            keyboardType: TextInputType.text,
            maxLength: 50,
            maxLines: 2,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "jana",
                fontStyle: FontStyle.normal,
                fontSize: 16.0
            ),
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'أبغي شقه في شمال الرياض لا تقل عن 200 متر و تكون بسعر مناسب لسكن أربع شباب',
              hintStyle: TextStyle(color: Colors.black),
            ),

          ),),
          SizedBox(height: size.height*0.02,),
          Row(children: [
            Text("عينات العرض",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
          ],),
          Row(children: [
            InkWell(
              onTap: () async {
                loadAssets();
                //print("ant");

                //getImageFiles();
                //getImage();
              },
              child: Container(child: DottedBorder(
                color: Colors.grey[300],
                strokeWidth: 1,
                dashPattern: [8, 4],
                borderType: BorderType.RRect,
                radius: Radius.circular(5),
                //padding: EdgeInsets.all(6),
                //strokeCap: StrokeCap.round,
                child: Container(
                  // margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                        width: 1,
                        style: BorderStyle.none
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),
                  width: size.width*0.90,
                  height: size.height*0.18,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Icon(Icons.add,color: Colors.grey,size: size.height*0.03,),
                      Text(
                        'إرفاق بعض الصور',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'jana',
                          fontSize: 14,
                        ),
                      ),

                    ],
                  ),
                ),),),
            ),          ],),
          Row(children: [

            Expanded(child: images == null
                ? Text('')
                :Container(
              height: 100.0,
              child: GridView.count(
                // padding: EdgeInsets.all(10),
                crossAxisCount: 10,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  // setState(() {
                  //   ss = asset;
                  // });
                  // print("assists is $asset");
                  return Container(
                    margin: EdgeInsets.only(left: 10),
                    child:AssetThumb(
                      asset: asset,
                      width: 300,
                      height: 300,
                    ),
                  );
                }),
              ),
            ),),
          ],),
          //buildGridView(),

          SizedBox(height: size.height*0.02,),
          Row(children: [
            Text("ميزانية العرض",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 16),),
          ],),
          Row(children: [
            Container(margin:EdgeInsets.all(8),color: Colors.grey[300],height: 45,width:size.width*0.30,child:TextField(
//            maxLength: 40,
              textAlign: TextAlign.center,
              controller: _controller2,
              keyboardType: TextInputType.number,
              maxLength: 10,
              autofocus: false,
              style: TextStyle(fontSize: 16.0, color: Colors.black,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.white38,
                hintText: '5000 \$',
                hintStyle: TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold),
                contentPadding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  top: 8.0,
                  right: 8.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),),

          ],),
          SizedBox(height: size.height*0.15,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(
            onTap: () async {
              _onLoadingRe(context);

            },
            child:Container(width:size.width*0.90,padding: EdgeInsets.only(left: 8,right:8,top: 8,bottom: 8),
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)
                ),
              ),
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [

                Text("إرسال العرض",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold),),

                Container(
                  height: size.height*0.06,
                  width: size.height*0.06,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),
                  child: Icon(Icons.send,color: Colors.white,),
                ),
              ],),

            ),),],)
        ],),),

      ],),)),),


    );
  }
  void _onLoadingRe(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () async {
      await addOffer(images,context,widget.id,_controller3.text,_controller2.text);
    });
  }
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  void getAPI() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get((sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/profile":'https://amer.jit.sa/api/vendor/profile',headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
      imageProfile = map['data']['image'];
    });

  }
  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#f6755f",
          actionBarTitle: "عامر",
          allViewTitle: "جميع الصور",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}