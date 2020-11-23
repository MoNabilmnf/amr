import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BNBCustompain.dart';

class Results extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResultState();
  }

}
class ResultState extends State<Results>{
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
        child:Container(padding:EdgeInsets.all(20),height: double.infinity,
            width: double.infinity,decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BG.png"), fit: BoxFit.cover)),child:
        SingleChildScrollView(scrollDirection: Axis.vertical,child:Column(children: [
        Row(children: [
          SizedBox(width: 50,),
          Spacer(),
          Text(
            'تنقية النتائج',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'jana',
              fontSize: 20,
            ),
          ),
          Spacer(),
          IconButton(icon: Icon(Icons.clear,size: 35,color: Colors.white,), onPressed: (){
            Navigator.pop(context);
          })
        ],),
          SizedBox(height: 20,),
          Row(children: [
            Text(
              'الميزانية المتاجة',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Container(alignment:Alignment.bottomCenter,margin:EdgeInsets.all(8),height: 45,width:size.width*0.40,child:TextField(
              textAlign: TextAlign.center,
//            maxLength: 40,
              controller: _controller,
              keyboardType: TextInputType.number,
              autofocus: false,
              style: TextStyle(fontSize: 14.0, color: Colors.white),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.white38,
                hintText: '3000 \$',
                hintStyle: TextStyle(color: Colors.white),
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
            Container(alignment:Alignment.bottomCenter,margin:EdgeInsets.all(8),height: 45,width:size.width*0.40,child:TextField(
//            maxLength: 40,
              textAlign: TextAlign.center,
              controller: _controller2,
              keyboardType: TextInputType.number,
              autofocus: false,
              style: TextStyle(fontSize: 14.0, color: Colors.white),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.white38,
                hintText: '5000 \$',
                hintStyle: TextStyle(color: Colors.white),
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
          Row(children: [
            Text(
              'عرض النتائج حسب',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),
          ],),
          Row(children: [
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white38,
                //disabledColor: Colors.blue
              ),
              child:Radio(
                  activeColor: Colors.white,
                  value: 88,
                  hoverColor: color1,
                  groupValue: groub,
                  onChanged: (T) {
                    //  print(T);
                    setState(() {
                      groub = T;

                    });
                  }),),
            Text(
              'اليوم',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),

          ],),
          Row(children: [
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white38,
                //disabledColor: Colors.blue
              ),
              child:Radio(
                  activeColor: Colors.white,
                  value: 77,
                  hoverColor: color1,
                  groupValue: groub,
                  onChanged: (T) {
                    //  print(T);
                    setState(() {
                      groub = T;

                    });
                  }),),
            Text(
              'الأحداث',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),
          ],),
          Row(children: [
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white38,
                //disabledColor: Colors.blue
              ),
              child:Radio(
                  activeColor: Colors.white,
                  value: 66,
                  hoverColor: color1,
                  groupValue: groub,
                  onChanged: (T) {
                    //  print(T);
                    setState(() {
                      groub = T;

                    });
                  }),),
            Text(
              'الأقدم',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),

          ],),
          Row(children: [
            Text(
              'التصنيفات',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),
          ],),

          Container(
            height: 150.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index){
                return new InkWell(
                  onTap: (){

                  },
                  child: Center(child: Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white38,
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

                          Icon(Icons.location_on_outlined,color: Colors.white,),
                          Text(
                            'الأراضي',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'jana',
                              fontSize: 14,
                            ),
                          ),

                        ],
                      ),
                    ),)
                );
              },
            ),
          ),
          SizedBox(height: 8,),
          Row(children: [
            Text(
              'المدينة',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),
          ],),

          Container(
            height: 40.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index){
                return new InkWell(
                  onTap: (){

                  },
                  child:  Center(child: Container(
                        width: 60,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'الرياض',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'jana',
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                      ),)
                );
              },
            ),
          ),
          SizedBox(height: 8,),
          Container(
            height: 40.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index){
                return new InkWell(
                  onTap: (){

                  },
                  child:  Center(child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                        ),
                        width: 50,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Text(
                              'جده',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'jana',
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                      ),)
                );
              },
            ),
          ),
          SizedBox(height: 20,),
          // new RaisedButton(
          //
          //   onPressed: () async {
          //    Navigator.pop(context);
          //   },
          //   color: Colors.white70,
          //   child:
          //       new Text("          تطبيق التغيرات          ",
          //           style: new TextStyle(
          //               fontSize: 15,
          //               color:  Colors.white,
          //               fontFamily: 'jana'
          //           )),
          //
          //
          // ),
          GestureDetector(
            onTap: (){
              print("Container clicked");
              //Navigator.pushNamed(context, "Home");
            },
            child:Container(
            height: size.height*0.07,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
            ),
            child: Center(child: Text(
              'تطبيق التغيرات',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'jana',
                fontSize: 14,
              ),
            ),),
          ),),
      ],),),),),
    );
  }

}