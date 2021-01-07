import 'dart:io';
import 'dart:convert';

import 'package:amr/Global.dart';
import 'package:amr/Screens/EditOrder2.dart';
import 'package:amr/Screens/NewOrder2.dart';
import 'package:http/http.dart' as http;
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditOrder extends StatefulWidget{
  EditOrder({this.id,this.CatId,this.SubCatId,this.CityId,this.DisId,this.Images,this.price,this.title,this.descrtiption,this.CityName,this.DisName,this.SubCatName});
  final int id,CatId,SubCatId,CityId,DisId;
  final List Images;
  final String price,title,descrtiption,CityName,DisName,SubCatName;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditOrderState();
  }

}
class EditOrderState extends State<EditOrder>{

  int CatID ;
  int SubCatId;
  String _value1;
  List<String> SubCat = new List();
  List<String> Cats = new List();
  List S = [];
  List SC = [];
  String _error = 'No Error Dectected';
  List<Asset> imagesNew = List<Asset>();
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  String _myActivity,_value;
  List<File>  ImageFiles = [];
  String _value4,_value3,_value2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCat();
    getSubCat();
    _controller.text = widget.title;
    _controller2.text = widget.descrtiption;
    CatID = widget.CatId;
    SubCatId = widget.SubCatId;

  }
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
              _controller.clear();
              _controller2.clear();
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
          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
            // Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
            //   decoration: BoxDecoration(
            //     color: Colors.grey[300],
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(5),
            //         topRight: Radius.circular(5),
            //         bottomLeft: Radius.circular(5),
            //         bottomRight: Radius.circular(5)
            //     ),
            //   ),
            //   child: Column(children: [
            //     Row(children: [
            //       Text('القسم',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
            //     ],),
            //     DropdownButtonHideUnderline(child:DropdownButton<String>(
            //       value: _value1,
            //       isExpanded: true,
            //       // items: [
            //       //   DropdownMenuItem<String>(
            //       //     child: Text('قطن',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
            //       //     value: '1',
            //       //   ),
            //       //   DropdownMenuItem<String>(
            //       //     child: Text('الرياض',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
            //       //     value: '2',
            //       //   ),
            //       //   DropdownMenuItem<String>(
            //       //     child: Text('جده',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
            //       //     value: '3',
            //       //   ),
            //       // ],
            //       // onChanged: (String value) {
            //       //   setState(() {
            //       //     print("$value");
            //       //     _value = value;
            //       //     // _isChose = true;
            //       //   });
            //       // },
            //       items: Cats.map((String value) {
            //         return new DropdownMenuItem<String>(
            //           value: value,
            //           child: new Text(value,style: TextStyle(color: Colors.black)),
            //         );
            //       }).toList(),
            //       onChanged: (String value) {
            //         setState(() {
            //           int postion = Cats.indexOf(value);
            //           print("$value");
            //           CatID = S[postion]['id'];
            //           SubCat.clear();
            //           SubCatId = 0;
            //           _value4 = null;
            //          // SC.clear();
            //           getSubCat(CatID);
            //           print("$value");
            //           _value1= value;
            //           // _isChose = true;
            //         });
            //       },
            //       hint: Text("القسم",textAlign: TextAlign.center,style: TextStyle(
            //           color: Colors.black,fontFamily: 'jana'),),
            //
            //     ),
            //     ),
            //   ],),
            //
            // ),
            (SubCat.isEmpty)?Container():Container(width:size.width*0.40,height:size.height*0.12 ,padding: EdgeInsets.only(left: 8,right:8 ),
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
                // Row(children: [
                //   Text('الفئة الفرعية',style: TextStyle(fontSize: 12.0,fontFamily: 'jana',color: Colors.grey)),
                // ],),
                DropdownButtonHideUnderline(child:DropdownButton<String>(
                  value: _value4,
                  isExpanded: true,
                  items: SubCat.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value,style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  // items: [
                  //   DropdownMenuItem<String>(
                  //     child: Text('تأجير',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                  //     value: '1',
                  //   ),
                  //   DropdownMenuItem<String>(
                  //     child: Text('شراء',style: TextStyle(fontSize: 14.0,fontFamily: 'jana',color: Colors.black)),
                  //     value: '2',
                  //   ),
                  //
                  // ],
                  onChanged: (String value) {
                    setState(
                            () {
                          print("$value");
                          int postion = SubCat.indexOf(value);
                          print("$value");
                          SubCatId = SC[postion]['id'];
                          print("$value");
                          _value4 = value;
                          // _isChose = true;
                        });
                  },
                  hint: Text("${widget.SubCatName}",textAlign: TextAlign.center,style: TextStyle(
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
                //getImageFiles();
                loadAssets();
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
            // Expanded(flex:2,child: ImageFiles == null
            //     ? Text('')
            //     :Container(
            //   height: 100.0,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: ImageFiles.length,
            //     itemBuilder: (BuildContext context, int index){
            //       return new InkWell(
            //           onTap: (){
            //
            //           },
            //           child: Center(child: Container(
            //             margin: EdgeInsets.only(left: 10),
            //             decoration: BoxDecoration(
            //               color: Colors.grey[300],
            //               borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(10),
            //                   topRight: Radius.circular(10),
            //                   bottomLeft: Radius.circular(10),
            //                   bottomRight: Radius.circular(10)
            //               ),
            //             ),
            //             width: 100,
            //             child: Column(mainAxisAlignment: MainAxisAlignment.center,
            //               children: <Widget>[
            //                 // Icon(Icons.location_on_outlined,color: Colors.white,),
            //                 // Text(
            //                 //   'الأراضي',
            //                 //   style: TextStyle(
            //                 //     color: Colors.white,
            //                 //     fontFamily: 'jana',
            //                 //     fontSize: 14,
            //                 //   ),
            //                 // ),
            //
            //                 Image.file(ImageFiles[index]),
            //
            //               ],
            //             ),
            //           ),)
            //       );
            //     },
            //   ),
            // ),),
            Expanded(flex:2,child: imagesNew == null
                ? Text('')
                :Container(
              height: 100.0,
              child: GridView.count(
                // padding: EdgeInsets.all(10),
                crossAxisCount:3,
                children: List.generate(imagesNew.length, (index) {
                  Asset asset = imagesNew[index];

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
              if(_controller.text.isEmpty){
                onBackPress(context,"أضف عنوانا");
                }else if(_controller2.text.isEmpty){
                onBackPress(context,"أضف وصفا");
              }else if(SubCatId == null){
                onBackPress(context,"أختر فئة فرعيه");
              }else if(imagesNew.isEmpty){
                onBackPress(context,"أضف صور");
              }else{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditOrder2(id:widget.id,title: _controller.text,description: _controller2.text,CatId: SubCatId,Images: imagesNew,CityName: widget.CityName,DisName: widget.DisName,price: widget.price,CityId: widget.CityId,DicId: widget.DisId,),
                    ));
                //Navigator.pushNamed(context, "NewOrder2");
              }
              //print("Container clicked");

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
  void getSubCat() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
   // sharedPrefs.remove('SubCatId');
    http.Response response = await http.get('https://amer.jit.sa/api/categories/${sharedPrefs.getString('CatId')}',headers: {"Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      SC = map['data']['categories'];
      for(int i = 0 ; i <SC.length; i++){
        SubCat.add(SC[i]['title']);
      }
      //City = map['data']['cities'];
    });

  }
  Future loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: imagesNew,
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
      imagesNew = resultList;

      _error = error;
    });
    return resultList;
    // for (int i = 0; i < imagess.length; i++) {
    //   var path = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
    //   multipart.add(await MultipartFile.fromFile(path, filename: 'myfile.jpg'));
    // }
  }
  void getCat() async {
    http.Response response = await http.get(
      'https://amer.jit.sa/api/categories',
      headers: {"Accept": "application/json"},
    );
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      S = map['data']['categories'];
      for (int i = 0; i < S.length; i++) {
        Cats.add(S[i]['title']);
      }
    });
  }
}