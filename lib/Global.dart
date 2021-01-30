import 'dart:io';

import 'package:flutter/material.dart';

String user_type = 'مشتري';
String Rsult = '';
String FCatID = '';
String FCityID = '';
String FpriceTo = '';
String FpriceFrom = '';
String F2CatID = '';
String F2CityID = '';
String F2priceTo = '';
String F2priceFrom = '';
String F2sort_by = '';
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
Future<void> CheckInternet(context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    onBackPress(context,"من فضلك تحقق من اتصالك بالانترنت");
    print('not connected');
  }
}