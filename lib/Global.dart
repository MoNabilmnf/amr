import 'package:flutter/material.dart';

String user_type = 'مشتري';
String Rsult = '';
Future<bool> onBackPress(context,message) {

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Text("$message",textAlign: TextAlign.right,style: TextStyle( ),),
        );
      }
  );
}