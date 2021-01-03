import 'package:amr/Global.dart';
import 'package:amr/user/Home_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import '../BNBCustompain.dart';

class deliverd_details extends StatefulWidget{
  deliverd_details({this.id,this.title,this.price});
  int id;
  String title,price;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return deliverd_detailsState();
  }

}
class deliverd_detailsState extends State<deliverd_details>{
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();

  int groub = 0;
  Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:Container(padding:EdgeInsets.all(size.width*0.02),child: SingleChildScrollView(scrollDirection: Axis.vertical,child:Column(children: [
          SizedBox(height: size.height*0.03,),
          Row(children: [
            SizedBox(width: 50,),
            Spacer(),
            Text(
              'معلومات التوصيل',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'jana',
                fontWeight: FontWeight.bold,
                fontSize: size.width*0.05,
              ),
            ),
            Spacer(),

            IconButton(icon: Icon(Icons.arrow_back_rounded,size: size.width*0.06,), onPressed: (){
              Navigator.pop(context);
            })
          ],),
          SizedBox(height: size.height*0.03,),
          Container(
            padding: EdgeInsets.all(size.width*0.03),
            height: size.height*0.15,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width*0.02),
                topRight: Radius.circular(size.width*0.02),
                bottomLeft: Radius.circular(size.width*0.02),
                 bottomRight: Radius.circular(size.width*0.02)
              ),
            ),child: Row(children: [
              Column(children: [
                Text("${widget.price} رس",
                    style: new TextStyle(
                        fontSize: size.width*0.04,
                        color:  Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'jana'
                    )),
                Text("التكلفة الكلية",
                    style: new TextStyle(
                        fontSize: size.width*0.025,
                        color:  Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'jana'
                    )),
              ],),
              Spacer(),
              Column(children: [
              Text("التاريخ",
                  style: new TextStyle(
                      fontSize: size.width*0.025,
                      color:  Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'jana'
                  )),
              Text("20-5-20",
                  style: new TextStyle(
                      fontSize: size.width*0.025,
                      color:  Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'jana'
                  )),
            ],),
          ],),),
          SizedBox(height: size.height*0.02,),
          Row(children: [
            Text("تفاصيل الفاتوره",
                style: new TextStyle(
                    fontSize: size.width*0.03,
                    color:  Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'jana'
                )),
          ],),
          SizedBox(height: size.height*0.01,),
          Row(children: [
            Text("أسم المنتج",
                style: new TextStyle(
                    fontSize: size.width*0.03,
                    color:  Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'jana'
                )),
            Spacer(),
            Text("${widget.title}",
                style: new TextStyle(
                    fontSize: size.width*0.03,
                    color:  Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'jana'
                )),
          ],),
          SizedBox(height: size.height*0.08,),
          Container(
            padding: EdgeInsets.all(size.width*0.03),
            height: size.height*0.25,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width*0.02),
                  topRight: Radius.circular(size.width*0.02),
                  bottomLeft: Radius.circular(size.width*0.02),
                  bottomRight: Radius.circular(size.width*0.02)
              ),
            ),child: TextField(
            controller: _controller,
            maxLines: 4,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'jana',
              fontWeight: FontWeight.bold,
              fontSize: size.width*0.03,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'ملاحظات',
             hintStyle: TextStyle(
               color: Colors.grey,
               fontFamily: 'jana',
               fontWeight: FontWeight.bold,
               fontSize: size.width*0.03,
             ),
             // border: OutlineInputBorder(),
            ),
          ),),
          SizedBox(height: size.height*0.01,),
          Text("أكتب أي ملاحظات خاصه تريد توصيلها للبائع",
              style: new TextStyle(
                  fontSize: size.width*0.03,
                  color:  Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'jana'
              )),
          SizedBox(height: size.height*0.14,),
          new Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    print("Container clicked");
                    String Res = await  AddAPI();
                    if(Res == "success"){
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home_user(),
                          ));
                    }else{
                      onBackPress(context,Res);
                    }

                    //Navigator.pushNamed(context, "NewOrder2");
                  },
                  child:Container(width:size.width*0.80,padding: EdgeInsets.only(left: 8,right:8,top: 8,bottom: 8),
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

                      Text("إتمام عملية الشراء",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: size.width*0.04,fontWeight: FontWeight.bold),),

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
                        child: Icon(Icons.keyboard_backspace_sharp,color: Colors.white,),
                      ),
                    ],),

                  ),),
            ),


      ],),),),),
    );
  }
  AddAPI() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    var d ={
      "offer_id":"${widget.id}",
      "note":"${_controller.text}"
    };
    http.Response response = await http.post('https://amer.jit.sa/api/user/offer/add-buy-request', body: d,
        headers: {HttpHeaders.authorizationHeader:  T,
          "Accept": "application/json",
        });
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if (response.statusCode == 200) {
      return 'success';
    } else {
      print(response.statusCode.toString());
      return responsebody['data']['message'].toString();
    }
  }
}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}