import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewOrder2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewOrder2State();
  }

}
class NewOrder2State extends State<NewOrder2>{
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  String _myActivity,_value;
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
          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
            Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
              ),
              child: Column(children: [
                Row(children: [
                  Text('المدينة',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                ],),
                DropdownButtonHideUnderline(child:DropdownButton<String>(
                  value: _value,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('قطن',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                      value: '3',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      print("$value");
                      _value = value;
                      // _isChose = true;
                    });
                  },
                  hint: Text("الرياض",textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.black,fontFamily: 'jana'),),

                ),
                ),
              ],),

            ),
            Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),
              ),
              child: Column(children: [
                Row(children: [
                  Text('الحي',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                ],),
                DropdownButtonHideUnderline(child:DropdownButton<String>(
                  value: _value,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('النقل القيروان',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                      value: '3',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      print("$value");
                      _value = value;
                      // _isChose = true;
                    });
                  },
                  hint: Text("النقل القيروان",textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.black,fontFamily: 'jana'),),

                ),
                ),
              ],),

            ),
          ],),
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
            onTap: (){
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

}