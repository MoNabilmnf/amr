import 'dart:io';

import 'package:amr/APIs/Api.dart';
import 'package:amr/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../BNBCustompain.dart';

class support extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return supportState();
  }
}

class supportState extends State<support> {
String data = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPI();

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
                  'الدعم الفني',
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
            new Center(
              child: SingleChildScrollView(
                child: Html(
                  data: """$data
                """,


                ),
              ),
            )
          ],
        ),
      ),),
    );
  }

  void getAPI() async {
    http.Response response = await http.get('https://amer.jit.sa/api/page/support',headers: {"Accept":"application/json"},);
    Map map = json.decode(response.body);
    print(map);
    setState(() {
      data = map['data']['text'];
    });

  }


}
