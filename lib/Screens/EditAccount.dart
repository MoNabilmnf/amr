import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:amr/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../BNBCustompain.dart';

class EditAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditAccountState();
  }
}

class EditAccountState extends State<EditAccount> {
  final picker = ImagePicker();
  File _image;
  String profileImage = '';
  Map Profile ;
  String _value1 ;
  List<String> City = new List();
  List C = [];
  int cityId;
  String username='';
  String CityName = '';

  Color color1 = colorFromHex("f6755f");
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _city = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPI();
    getCity();
  }
  @override
  Widget build(BuildContext context) {
    CheckInternet(context);
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:Container(
          padding: EdgeInsets.only(top: size.height*0.04),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Spacer(),
                Text(
                  'تعديل الحساب',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'jana',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),

              ],
            ),
            //(_image != null)?
            ListTile(
              title:Row(children: [ Icon(Icons.camera_alt,color: Colors.grey,),],),
              leading: _image == null
                  ?  Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: color1,
                  //borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  image: DecorationImage(
                    image: NetworkImage((profileImage.isNotEmpty)?"$profileImage":"https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  :Image.file(_image),
              subtitle: GestureDetector(onTap:() async {
                getImage();
              },child: Text(
                'تغير صورة الملف الشخصي',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'jana',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),),
            ),
            // Container(
            //   width: 50,height: 50,
            //   child: _image == null
            //       ? Text('No image selected.')
            //       : Image.file(_image),
            // ),
            //     :ListTile(
            //   title:Row(children: [ Icon(Icons.camera_alt,color: Colors.grey,),],),
            //   leading: Container(
            //     margin: EdgeInsets.all(5),
            //     width: 60.0,
            //     height: 60.0,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //       image: DecorationImage(
            //         image: NetworkImage((username.isEmpty)?"":"${Profile['image']}"),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            //   subtitle: GestureDetector(onTap:() async {
            //     getImageFiles();
            //   },child: Text(
            //     'تغير صورة الملف الشخصي',
            //     style: TextStyle(
            //       color: Colors.grey,
            //       fontFamily: 'jana',
            //       fontWeight: FontWeight.bold,
            //       fontSize: 12,
            //     ),
            //   ),),
            // ),

            SizedBox(height: size.height*0.05,),
            Container(margin:EdgeInsets.all(20),child: Column(children: [
              Row(children: [
                Text(
                  'إسم المستخدم',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'jana',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(5),
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),

                  ),
                  child: IconButton(onPressed: (){
                    _onusernamePress();
                  },icon: Icon(Icons.edit,color: Colors.white,size: 18,),),
                ),
              ],),
              Row(children: [
                Text(
                  (username.isEmpty)?"":'$username',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'jana',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],),
              SizedBox(height: 20,),
              Row(children: [
                Text(
                  'وصف سريع',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'jana',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(5),
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),

                  ),
                  child: IconButton(onPressed: (){

                  },icon: Icon(Icons.edit,color: Colors.white,size: 18,),),
                ),
              ],),
              Row(children: [
                Text(
                  'مكتب متخصص في عقارات شمال العراق',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'jana',
                    //fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],),
              SizedBox(height: 20,),
              Row(children: [
                Text(
                  'المدينة',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'jana',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(5),
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),

                  ),
                  child: IconButton(onPressed: (){
                    _oncityPress();
                  },icon: Icon(Icons.edit,color: Colors.white,size: 18,),),
                ),
              ],),
              Row(children: [
                Text(
                  (CityName.isEmpty)?"":'$CityName',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'jana',
                    //fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],),




            ],),),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 10),  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    //bottomLeft: Radius.circular(8),
                    // bottomRight: Radius.circular(8)
                  ),
                ),child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(
                    onTap: () async {
                      CheckInternet(context);
                      print("Container clicked");
                      _onLoadingLogin(context);

                      //Navigator.pushNamed(context, "NewOrder2");
                    },
                    child:Container(padding: EdgeInsets.only(left: 8,right:8 ,top: 8,bottom: 8),
                      decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)
                        ),
                      ),
                      child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [

                        Text("حفظ التعديلات",style: TextStyle(color: Colors.white,fontFamily: 'Jana',fontSize: 14,fontWeight: FontWeight.bold),),
                        SizedBox(width: 8,),
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
                          child: Icon(Icons.save,color: Colors.white,),
                        ),
                      ],),

                    ),),],) ,

                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(
                    onTap: (){
                      print("Container clicked");
                      setState(() {
                        _image = null;
                        CityName = '';
                        username = '';
                        getAPI();
                      });
                      //Navigator.pushNamed(context, "NewOrder2");
                    },
                    child:Container(padding: EdgeInsets.only(left: 8,right:8 ,top: 8,bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)
                        ),
                      ),
                      child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [

                        Text("تراجع",style: TextStyle(color: Colors.grey,fontFamily: 'Jana',fontSize: 14,fontWeight: FontWeight.bold),),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height*0.06,
                          width: size.height*0.06,
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            ),
                          ),
                          child: Icon(Icons.keyboard_return,color: Colors.grey,),
                        ),
                      ],),

                    ),),],) ,

                ],),),

              ),
            )
          ],
        ),
      ),),
    );
  }
  void getCity() async {
    http.Response response = await http.get('https://amer.jit.sa/api/cities',headers: {"Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      C = map['data']['cities'];
      for(int i = 0 ; i <C.length; i++){
        City.add(C[i]['title']);
      }
      //City = map['data']['cities'];
    });

  }
  void getAPI() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString('token');
    http.Response response = await http.get((sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/profile":'https://amer.jit.sa/api/vendor/profile',headers: {HttpHeaders.authorizationHeader:"$token","Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    print(token);
    setState(() {
      Profile = map['data'];
      username = map['data']['username'];
      profileImage =  map['data']['image'];
      cityId = map['data']['city']['id'];
      CityName = map['data']['city']['title'];
    });

  }
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

    setState(() async {
      if (pickedFile != null) {
        // ImageFiles.add(File(pickedFile.path));
        _image = File(pickedFile.path);
       // await EditImage(_image,username,cityId);
      } else {
        print('No image selected.');
      }
    });
  }
  Future<bool> _onusernamePress() {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content:Theme(
                data: new ThemeData(
                    primaryColor: Colors.grey,
                    accentColor: Colors.grey,
                    hintColor: Colors.grey
                ),
                child:TextFormField(
                  textDirection: TextDirection.rtl,
                  controller: _phone,
                  cursorColor: Colors.grey,
                  maxLength: 50,
                  textAlign:TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      counterText: '',
                      //border: InputBorder.none,
                      labelText: 'اسم المستخدم'
                  ),
                ),),
              actions: <Widget>[
                FlatButton(
                  child: Text("حفظ",style: TextStyle(color: Colors.deepPurple),),
                  onPressed: () async {
                    setState(() {
                      username = _phone.text;
                    });
                    Navigator.of(context).pop();
                    // String Res = await Addinter(_phone.text,cityId);
                    // if(Res == 'success'){
                    //   Navigator.of(context).pop();
                    //   getAPI();
                    // }
                    //Navigator.of(context).pop();
                    //Brands.clear();
                    //getAPI('https://dashboard.urate.sa/api/mobile/all-brands?search=${_phone.text}','Brands');

                  },
                ),

              ]

          );
        }
    );
  }
  Future<bool> _oncityPress() {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content:DropdownButtonHideUnderline(child:DropdownButton<String>(
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
                    child: new Text(value,style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    int postion = City.indexOf(value);
                    print("$value");
                    _value1 = value;
                    cityId =C[postion]['id'];
                    CityName = value;
                    Navigator.of(context).pop();
                    // _isChose = true;
                  });
                },
                hint: Text("الرياض",textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.black,fontFamily: 'jana'),),

              ),
              ),
              // actions: <Widget>[
              //   FlatButton(
              //     child: Text("حفظ",style: TextStyle(color: Colors.deepPurple),),
              //     onPressed: () async {
              //       Navigator.of(context).pop();
              //       // String Res = await Addinter(username,cityId);
              //       // if(Res == 'success'){
              //       //
              //       //   getAPI();
              //       //   Navigator.of(context).pop();
              //       // }
              //       //Navigator.of(context).pop();
              //       //Brands.clear();
              //       //getAPI('https://dashboard.urate.sa/api/mobile/all-brands?search=${_phone.text}','Brands');
              //
              //     },
              //   ),
              //
              // ]

          );
        }
    );
  }
  void _onLoadingLogin(context) {
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
      if(_image == null){

        String Res = await Addinter(username,cityId);
        if(Res == "success"){

          Navigator.pop(context);
          onBackPress(context, "تم تحديث البيانات بنجاح");
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.pop(context);
          });
        }else{
          Navigator.pop(context);
          onBackPress(context,"$Res");
        }
      }else{
      String Res = await EditImage(context,_image,username,cityId);
      print(Res);
      if(Res == 'success'){
        // Navigator.of(context).pop();
        //getAPI();
        print(Res);
      }
      }
    });

  }

  Addinter(username,city_id) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    var body = {
      "username":"$username",
      "city_id":'$city_id'
    };
    http.Response response = await http.post((sharedPrefs.getString('UserType') == 'مشتري')?"https://amer.jit.sa/api/user/profile/update":"https://amer.jit.sa/api/vendor/profile/update",body: body,headers: {HttpHeaders.authorizationHeader:  T, "Accept":"application/json"});
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if(response.statusCode == 200){


      return 'success';
    }else{

      return '${responsebody['data']['message']}';
    }
  }

}
