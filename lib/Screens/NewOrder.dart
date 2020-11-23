import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewOrder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewOrderState();
  }

}
class NewOrderState extends State<NewOrder>{
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
        child:Container(padding:EdgeInsets.only(top: size.height*0.05,left: 20,right: 20,bottom: 20),child:
        SingleChildScrollView(scrollDirection: Axis.vertical,child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
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
          Text("عنوان المنتج",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
        ],),
        Container(height:70,child: TextField(
            controller: _controller,
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
              hintText: 'شقة في شمال الرياض - 4 غرف \n',
              hintStyle: TextStyle(color: Colors.black),
            ),

          ),),
         // SizedBox(height: 20,),
          Row(children: [
            Text("وصف قصير",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
          ],),
          Container(height:140,child: TextField(
            controller: _controller2,
            keyboardType: TextInputType.text,
            maxLength: 250,
            maxLines: 5,
            style: new TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "jana",
                fontStyle: FontStyle.normal,
                fontSize: 14.0
            ),

            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'شقة في عماره جديدة مكونة من : \n - ثلاث غرف نوم \n - صالة \n - مجلس \n - مطبخ و مكيفات راكبه',
              hintStyle: TextStyle(color: Colors.black),
            ),

          ),),
          Row(children: [
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
                  Text('القسم',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
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
                  hint: Text("قطن",textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.black,fontFamily: 'jana'),),

                ),
                ),
              ],),

            ),
          ],),
          SizedBox(height: 8,),
          Row(children: [
            Text("إرفاق صور",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
          ],),
          SizedBox(height: 5,),
          Row(children: [
            Expanded(flex:1,child: InkWell(
              onTap: (){
                getImageFiles();
                //getImage();
              },
              child: Container(margin: EdgeInsets.only(right: 1,left: 10),child: DottedBorder(
                color: Colors.grey,
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
                  width: 100,
                  height: 100,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Icon(Icons.cloud_upload,color: Colors.grey,),
                      // Text(
                      //   'الأراضي',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontFamily: 'jana',
                      //     fontSize: 14,
                      //   ),
                      // ),

                    ],
                  ),
                ),),),
            ),),
            Expanded(flex:2,child: ImageFiles == null
                ? Text('')
                :Container(
              height: 100.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: ImageFiles.length,
                itemBuilder: (BuildContext context, int index){
                  return new InkWell(
                      onTap: (){

                      },
                      child: Center(child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                        ),
                        width: 100,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Icon(Icons.location_on_outlined,color: Colors.white,),
                            // Text(
                            //   'الأراضي',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontFamily: 'jana',
                            //     fontSize: 14,
                            //   ),
                            // ),

                            Image.file(ImageFiles[index]),

                          ],
                        ),
                      ),)
                  );
                },
              ),
            ),),
          ],),

          Row(children: [

            // _image == null
            //     ? Text('')
            //     :Container(margin: EdgeInsets.only(right: 1,left: 10),child: DottedBorder(
            //   color: Colors.grey,
            //   strokeWidth: 1,
            //   dashPattern: [8, 4],
            //   borderType: BorderType.RRect,
            //   radius: Radius.circular(5),
            //   //padding: EdgeInsets.all(6),
            //   //strokeCap: StrokeCap.round,
            //   child: Container(
            //     // margin: EdgeInsets.only(left: 10),
            //     decoration: BoxDecoration(
            //       color: Colors.grey[300],
            //       border: Border.all(
            //           width: 1,
            //           style: BorderStyle.none
            //       ),
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(5),
            //           topRight: Radius.circular(5),
            //           bottomLeft: Radius.circular(5),
            //           bottomRight: Radius.circular(5)
            //       ),
            //     ),
            //     width: 100,
            //     height: 100,
            //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //
            //          Image.file(_image),
            //
            //
            //       ],
            //     ),
            //   ),),),
            // Center(
            //   child: _image == null
            //       ? Text('')
            //       : Image.file(_image),
            // ),


          ],),
          SizedBox(height: 50,),
          Align(alignment: Alignment.bottomCenter,child:GestureDetector(
            onTap: (){
              print("Container clicked");
              Navigator.pushNamed(context, "NewOrder2");
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

                Text("الخطوه التالية",style: TextStyle(color: Colors.black,fontFamily: 'Jana',fontSize: 14,fontWeight: FontWeight.bold),),
                Spacer(),
                Text("1 من 2",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14),),
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
                  child: Icon(Icons.keyboard_backspace_sharp,color: Colors.black,),
                ),
              ],),

            ),),),

      ],),),),),
    );
  }
  File _image;
  final picker = ImagePicker();
  List<File>  ImageFiles = [];
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getImageFiles() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        ImageFiles.add(File(pickedFile.path));
        //_image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}