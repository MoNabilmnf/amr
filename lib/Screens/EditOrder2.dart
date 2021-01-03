import 'dart:io';
import 'dart:convert';

import 'package:amr/APIs/Api.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';

class EditOrder2 extends StatefulWidget{
  EditOrder2({this.id,this.Images,this.CatId,this.title,this.description,this.CityName,this.DisName,this.price,this.CityId,this.DicId});
  final int CatId,id,CityId,DicId;
  final String title,description,CityName,DisName,price;
  final List<File> Images;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditOrder2State();
  }

}
class EditOrder2State extends State<EditOrder2>{
  List<String> Cats = new List();
  List<String> City = new List();
  List<String> SubCat = new List();
  List<String> DDD = new List();
  int CatID, SubCatID;
  List Imagess = [];
  List S = [];
  List C = [];
  List SC = [];
  List Dis = [];
  int CityId, DicId;
  String CityName = 'المدينة';
  String DicName = 'الحي';
  // int SubCatId;
  String _value1, _value2;
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  String _myActivity,_value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCity();
    _controller2.text = widget.price;
    CityId = widget.CityId;
    DicId = widget.DicId;
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:Container(padding:EdgeInsets.only(top: size.height*0.05,left: 20,right: 20,bottom: 20),child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
        Row(children: [
          Container(
            height: size.height*0.06,
            width: size.height*0.06,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
              ),
            ),
            child: IconButton(icon: Icon(Icons.check,color: Colors.black),onPressed: (){
              //Navigator.pushNamed(context, "Results");
            },),
          ),
          SizedBox(width: 5,),
          Container(
            height: size.height*0.06,
            width: size.height*0.06,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
              ),
            ),
            child: IconButton(icon: Icon(Icons.delete_outline,color: Colors.black,),onPressed: (){
              //Navigator.pushNamed(context, "Results");
            },),
          ),
          Spacer(),
          IconButton(icon: Icon(Icons.clear), onPressed: (){
            Navigator.pop(context);
          })
        ],),
        SizedBox(height: 20,),
        Row(children: [
          Text("موقع العقار",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
        ],),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.40,
                  height: size.height * 0.12,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      // Row(
                      //   children: [
                      //     Text('المدينة',
                      //         style: TextStyle(
                      //             fontSize: 12.0,
                      //             fontFamily: 'jana',
                      //             color: Colors.grey)),
                      //   ],
                      // ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _value1,
                          isExpanded: true,
                          // items: [
                          //   DropdownMenuItem<String>(
                          //     child: Text('قطن',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          //     value: '1',
                          //   ),
                          //   DropdownMenuItem<String>(
                          //     child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          //     value: '2',
                          //   ),
                          //   DropdownMenuItem<String>(
                          //     child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          //     value: '3',
                          //   ),
                          // ],
                          items: City.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value,
                                  style:
                                  TextStyle(color: Colors.black)),
                            );
                          }).toList(),
                          onChanged: (String value) async {
                            setState(() {
                              int postion = City.indexOf(value);
                              print("$value");
                              _value1 = value;
                              CityId = C[postion]['id'];
                              DDD.clear();
                              DicId = 0;
                              getDic(CityId);
                              // _isChose = true;
                            });
                            // ssss = await getDic(CityId);
                            // if(D.isNotEmpty){
                            //   setState(()  {
                            //     print("$ssss");
                            //     //D.addAll(ssss);
                            //     // Dis.addAll(cc);
                            //     Ha = true;
                            //   });
                            // }
                          },
                          hint: Text(
                            "${widget.CityName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // (DDD.isEmpty)
                //     ? Container()
                //     :
                Container(
                  width: size.width * 0.40,
                  height: size.height * 0.12,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      // Row(
                      //   children: [
                      //     Text('الحي',
                      //         style: TextStyle(
                      //             fontSize: 12.0,
                      //             fontFamily: 'jana',
                      //             color: Colors.grey)),
                      //   ],
                      // ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _value2,
                          isExpanded: true,
                          // items: [
                          //   DropdownMenuItem<String>(
                          //     child: Text('قطن',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          //     value: '1',
                          //   ),
                          //   DropdownMenuItem<String>(
                          //     child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          //     value: '2',
                          //   ),
                          //   DropdownMenuItem<String>(
                          //     child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                          //     value: '3',
                          //   ),
                          // ],
                          items: DDD.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value,
                                  style: TextStyle(
                                      color: Colors.black)),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              int postion = DDD.indexOf(value);
                              print("$value");
                              _value2 = value;
                              DicId = Dis[postion]['id'];
                              // _isChose = true;
                            });
                          },
                          hint: Text(
                            "${widget.DisName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Row(children: [
            Text("قم بتحديد سعرالمنتج",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
          ],),
          Row(children: [
            Container(alignment:Alignment.bottomCenter,margin:EdgeInsets.all(8),height: 45,width:size.width*0.80,child:TextField(
//            maxLength: 40,
              textAlign: TextAlign.center,
              controller: _controller2,
              keyboardType: TextInputType.number,
              maxLength: 10,
              autofocus: false,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.white38,
                hintText: '5000 \$',
                hintStyle: TextStyle(color: Colors.black),
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

          SizedBox(height: 50,),
          Align(alignment: Alignment.bottomCenter,child:GestureDetector(
            onTap: () async {
               if(CityId == null){
                onBackPress(context,"أختر مدينة");
              }else if( DicId== null){
                onBackPress(context,"أختر حي");
              }else if(_controller2.text.isEmpty){
                 onBackPress(context,"أضف سعر");
               }else{
                 String Res = await UpdateOffer(widget.id,widget.Images, context,widget.CatId,widget.title,widget.description,CityId,DicId,_controller2.text);
                 if(Res == 'Success'){
                   Navigator.pop(context);
                   Navigator.pop(context);
                   Navigator.pushReplacementNamed(context, "Home");
                 }else{
                   print(Res.toString());
                 }
                //Navigator.pushNamed(context, "NewOrder2");
              }
              print("Container clicked");
            },
            child:Container(width:size.width*0.80,height:size.height*0.08 ,padding: EdgeInsets.only(left: 8,right:8 ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)
                ),
              ),
              child: Row(children: [

                Text("إنهاء و نشر",style: TextStyle(color: Colors.black,fontFamily: 'Jana',fontSize: 14,fontWeight: FontWeight.bold),),
                Spacer(),
                Text("2 من 2",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
                SizedBox(width: 8,),
                Container(
                  height: size.height*0.06,
                  width: size.height*0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),
                  child: Icon(Icons.cloud_upload,color: Colors.black,),
                ),
              ],),

            ),),),

      ],),),),
    );
  }
  void getDic(id) async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/cities/$id',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      Dis = map['data']['cities'];
      for (int i = 0; i < Dis.length; i++) {
        DDD.add(Dis[i]['title']);
      }
    });

    //onButtonPressedfloat(context);
  }
  void getCity() async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/cities',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      C = map['data']['cities'];
      for (int i = 0; i < C.length; i++) {
        City.add(C[i]['title']);
      }
      //City = map['data']['cities'];
    });
  }
}