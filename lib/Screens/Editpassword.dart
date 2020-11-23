import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BNBCustompain.dart';

class Editpassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditpasswordState();
  }
}

class EditpasswordState extends State<Editpassword> {
  Color color1 = colorFromHex("f6755f");
  @override
  Widget build(BuildContext context) {
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
                  'تعديل كلمة السر',
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
            ListTile(
              title:Row(children: [ Icon(Icons.camera_alt,color: Colors.grey,),],),
              leading: Container(
                margin: EdgeInsets.all(5),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.aalforum.eu/wp-content/uploads/2016/04/profile-placeholder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              subtitle: Text(
                'تغير صورة الملف الشخصي',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'jana',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
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

                  },icon: Icon(Icons.edit,color: Colors.white,size: 18,),),
                ),
              ],),
              Row(children: [
                Text(
                  'مكتب الهدف العقاري',
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

                  },icon: Icon(Icons.edit,color: Colors.white,size: 18,),),
                ),
              ],),
              Row(children: [
                Text(
                  'الرياض - المملكة العربية السعودية',
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
                    onTap: (){
                      print("Container clicked");
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
}
