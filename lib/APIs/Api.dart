import 'dart:io';
import 'package:amr/Global.dart';
import 'package:async/async.dart';

import 'package:http/http.dart' as http;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
Logout(link) async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  String token = sharedPrefs.getString('token') ;
  http.Response response = await http.get('$link',headers: { "Accept":"application/json",'Content-type': 'application/json','Authorization':token});
  print(response.body.toString());
  var responsebody = json.decode(response.body);
  if(response.statusCode == 200){
    return 'success';
  }
}
// CreateAccount(_image,_controller,_controller3,_controller2,_controller4,_value1) async {
//   final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
//   String T = sharedPrefs.getString('token');
//   Map Res;
//   var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
//   var length = await _image.length();
//   var D = {"username":'$_controller',"email":'$_controller3',"phone":'$_controller2',
//     "description":"e.h.m775188@gmail.com",
//     "password":"$_controller4",
//     "city_id":"$_value1"
//   };
//   var uri = Uri.parse("https://amer.jit.sa/api/user/order/store");
//   var request = new http.MultipartRequest("POST", uri);
//   var multipartFile;
//   var _image = new http.MultipartFile('image', stream, length,
//       filename: basename(_image.path));
//   request.files.addAll(_image);
//   request.fields.addAll(D);
//   var response = await request.send();
// }
EditImage(imageFile,username,cityId) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  String T = sharedPrefs.getString('token');
  String Res;
  print("token $cityId is $T");
  // List<Asset> imagess = List<Asset>();
  // List<http.MultipartFile> multipart = List<http.MultipartFile>();
  // for (int i = 0; i < imagess.length; i++) {
  //   var path = await FlutterAbsolutePath.getAbsolutePath(imagess[i].identifier);
  //   multipart.add(await http.MultipartFile.fromFile(path, filename: 'myfile.jpg'));
  // }
  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  var D = {"username":'$username',"city_id":cityId};
  var uri = Uri.parse((user_type == 'مشتري')?"https://amer.jit.sa/api/user/profile/update":"https://amer.jit.sa/api/vendor/profile/update");
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile('image', stream, length,
      filename: basename(imageFile.path));
  request.headers.addAll({HttpHeaders.authorizationHeader:  T, "Accept":"application/json"});
  request.files.add(multipartFile);
  request.fields.addAll(D);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) async {
    Map valueMap = json.decode(value);
    print(valueMap.toString());
    if(response.statusCode == 200){
      Rsult = valueMap['data'][0].toString();
      return valueMap['data'][0].toString();

    }else{
      Rsult = valueMap['data'][0].toString();
      Res = valueMap['data'][0].toString();
      return valueMap['data'][0].toString();
    }

  });
  print("sadsdasadsad------ $Res");
  return Res.toString();
}
CreateAccount2(imageFile,_controller,_controller3,_controller2,_controller4,_value1,category_id,sub_category_id) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  String T = sharedPrefs.getString('token');
  String Res;
  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  var D = {"username":'$_controller',"email":'$_controller3',"phone":'$_controller2',
    "password":"$_controller4",
    "city_id":"$_value1",
    "category_id":"$category_id",
    "sub_category_id":"$sub_category_id"
  };
  var uri = Uri.parse("https://amer.jit.sa/api/vendor/register");
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile('image', stream, length,
      filename: basename(imageFile.path));
  request.headers.addAll({HttpHeaders.authorizationHeader: "Bearer "+ T, "Accept":"application/json"});
  request.files.add(multipartFile);
  request.fields.addAll(D);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) async {
    Map valueMap = json.decode(value);
    print(valueMap.toString());
    print(_value1.toString());
    if(response.statusCode == 200){
      Rsult = valueMap['data'][0].toString();
      return valueMap['data'][0].toString();

    }else{
      Rsult = valueMap['data'][0].toString();
      Res = valueMap['data'][0].toString();
      return valueMap['data'][0].toString();
    }

  });
  print("sadsdasadsad------ $Res");
  return Res.toString();
}


Future uploadmultipleimage(List images) async {
  var uri = Uri.parse("https://amer.jit.sa/api/user/order/store");
  String T = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdXNlclwvbG9naW4iLCJpYXQiOjE2MDkxODgwODcsImV4cCI6MTYwOTE5MTY4NywibmJmIjoxNjA5MTg4MDg3LCJqdGkiOiJjbWIxT251YUZxNjBiNVcyIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.t8n2kdPadnuaEWHjPJ_1ljQeoiLq-xREhKa8t9G8AFY';
  http.MultipartRequest request = new http.MultipartRequest('POST', uri);
  request.headers.addAll(
      {HttpHeaders.authorizationHeader: T, "Accept": "application/json"});
  request.fields['category_id'] = '1';
  request.fields['sub_category_id'] = '5';
  request.fields['title'] = 'sddz';
  request.fields['description'] = 'description';
  request.fields['city_id'] = '1';
  request.fields['district_id'] = '8';
  request.fields['price_from'] = '250';
  request.fields['price_to'] = '5000';
  //request.fields['district_id'] = '8';
  //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));
  List<http.MultipartFile> newList = new List<http.MultipartFile>();
  for (int i = 0; i < images.length; i++) {
    File imageFile = File(images[i].toString());
    var stream =
    new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var multipartFile = new http.MultipartFile("imagefile", stream, length,
        filename: basename(imageFile.path));
    newList.add(multipartFile);
  }
  request.files.addAll(newList);
  var response = await request.send();
  if (response.statusCode == 200) {
    print("Image Uploaded");
  } else {
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
EditOrder(order_id,List images, context,category_id,sub_category_id,title,description,city_id,district_id,price_from,price_to) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  String T = sharedPrefs.getString('token');
  //print(images.toString());
  List<http.MultipartFile> Demo = new List<http.MultipartFile>();
  // var stream = new http.ByteStream(DelegatingStream.typed(images[0].openRead()));
  // var length = await images[0].length();
  // var multipartFile = new http.MultipartFile('image', stream, length,
  //     filename: basename(images[0].path));

    for (int i = 0; i < images.length; i++) {
      var stream = new http.ByteStream(
          DelegatingStream.typed(images[i].openRead()));
      var length = await images[i].length();
      var multipartFile = new http.MultipartFile('images[$i]', stream, length,
          filename: basename(images[i].path));
      Demo.add(multipartFile);

  }

  //print("888888 $multipartFile");
  print("88888844 $Demo");
  var D = {"order_id": "$order_id","category_id": '$category_id', "sub_category_id": '$sub_category_id', "title": '$title',
    "description": "$description",
    "city_id": "$city_id",
    "district_id": "$district_id",
    "price_from": "$price_from",
    "price_to": "$price_to"
    //"images":images
  };
  // String T = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdXNlclwvbG9naW4iLCJpYXQiOjE2MDkzMTcxNDQsImV4cCI6MTYwOTU3NjM0NCwibmJmIjoxNjA5MzE3MTQ0LCJqdGkiOiJ2anZuZThmZFpDTkRwTmZoIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.9n49oOiEnMVsebinIqqdtbj0hP70ziu1y9lE6C9SjY8';
  //String T = sharedPrefs.getString('token');
  var uri = Uri.parse("https://amer.jit.sa/api/user/order/update");
  var request = new http.MultipartRequest("POST", uri);
  request.headers.addAll(
      {HttpHeaders.authorizationHeader: T, "Accept": "application/json","Content-Type":"application/json"});
  request.fields.addAll(D);

    request.files.addAll(Demo);


  var response = await request.send();
  if (response.statusCode == 200) {
    print("Image Uploaded");
    return 'Success';
  } else {
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) async {
    Map valueMap = json.decode(value);
    // print(valueMap.toString());
    // print(_value1.toString());
    if (response.statusCode == 200) {
      Rsult = valueMap['data'][0].toString();
      return 'Success';
    } else {
      Rsult = valueMap['data'][0].toString();
      onBackPress(context, "${valueMap}");
      //Res = valueMap['data'][0].toString();
      return valueMap['data'][0].toString();
    }
  });
  // response.stream.transform(utf8.decoder).listen((value) {
  //   onBackPress(context,"$value");
  //   print(value);
  // });
}
EditOrder2(order_id,context,category_id,sub_category_id,title,description,city_id,district_id,price_from,price_to) async {
  //String T = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdXNlclwvbG9naW4iLCJpYXQiOjE2MDkzMTcxNDQsImV4cCI6MTYwOTU3NjM0NCwibmJmIjoxNjA5MzE3MTQ0LCJqdGkiOiJ2anZuZThmZFpDTkRwTmZoIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.9n49oOiEnMVsebinIqqdtbj0hP70ziu1y9lE6C9SjY8';
  var D = {"order_id": "$order_id","category_id": '$category_id', "sub_category_id": '$sub_category_id', "title": '$title',
    "description": "$description",
    "city_id": "$city_id",
    "district_id": "$district_id",
    "price_from": "$price_from",
    "price_to": "$price_to"
    //"images":images
  };
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  String T = sharedPrefs.getString('token');
  http.Response response = await http.post('https://amer.jit.sa/api/user/order/update', body: json.encode(D),
      headers: {
        HttpHeaders.authorizationHeader: T,
        "Accept": "application/json",
        'Content-type': 'application/json',
      });
  print(response.body.toString());
  var responsebody = json.decode(response.body);
  if (response.statusCode == 200) {
    return 'Success';
  } else {
    onBackPress(context, "${responsebody['data']}");
    print(response.statusCode.toString());
    return responsebody['data'];
  }
}
UpdateOffer(id,List images, context,sub_category_id,title,description,city_id,district_id,price) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  //String T = sharedPrefs.getString('token');
  print(images.toString());
  List<http.MultipartFile> Demo = new List<http.MultipartFile>();
  // var stream = new http.ByteStream(DelegatingStream.typed(images[0].openRead()));
  // var length = await images[0].length();
  // var multipartFile = new http.MultipartFile('image', stream, length,
  //     filename: basename(images[0].path));
  for (int i = 0; i < images.length; i++) {
    var stream = new http.ByteStream(
        DelegatingStream.typed(images[i].openRead()));
    var length = await images[i].length();
    var multipartFile = new http.MultipartFile('images[$i]', stream, length,
        filename: basename(images[i].path));
    Demo.add(multipartFile);
  }
  //print("888888 $multipartFile");
  print("88888844 $Demo");
  var D = {"offer_id":"$id","sub_category_id": '$sub_category_id', "title": '$title',
    "description": "$description",
    "city_id": "$city_id",
    "district_id": "$district_id",
    "price": "$price"

    //"images":images
  };
  print("pody is $D");
  //String T = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdmVuZG9yXC9sb2dpbiIsImlhdCI6MTYwOTM1ODc0OSwiZXhwIjoxNjA5NjE3OTQ5LCJuYmYiOjE2MDkzNTg3NDksImp0aSI6Im41TXF5NFRrMlJhWkh3TGkiLCJzdWIiOjMsInBydiI6IjkyM2E3Mzc1YjY1NmNhNWJiOWE3MjE2MjNmZTU5ZWI1ZjQ1MWYzZTkifQ.36kWI2HhZWEu8UsBT6F37O5K1FnHKdf7xCTv8i2TT2k';
  String T = sharedPrefs.getString('token');
  var uri = Uri.parse("https://amer.jit.sa/api/vendor/offer/update");
  var request = new http.MultipartRequest("POST", uri);
  request.headers.addAll(
      {HttpHeaders.authorizationHeader: T, "Accept": "application/json","Content-Type":"application/json"});
  request.fields.addAll(D);

  request.files.addAll(Demo);
  var response = await request.send();
  if (response.statusCode == 200) {
    print("Image Uploaded");
    return 'Success';
  } else {
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) async {
    Map valueMap = json.decode(value);
    // print(valueMap.toString());
    // print(_value1.toString());
    if (response.statusCode == 200) {
      Rsult = valueMap['data'][0].toString();
      return 'Success';
    } else {
      Rsult = valueMap['data'][0].toString();
      onBackPress(context, "${valueMap}");
      //Res = valueMap['data'][0].toString();
      return valueMap['data'][0].toString();
    }
  });
  // response.stream.transform(utf8.decoder).listen((value) {
  //   onBackPress(context,"$value");
  //   print(value);
  // });
}
CreateOffer(List images, context,sub_category_id,title,description,city_id,district_id,price) async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  //String T = sharedPrefs.getString('token');
  print(images.toString());
  List<http.MultipartFile> Demo = new List<http.MultipartFile>();
  // var stream = new http.ByteStream(DelegatingStream.typed(images[0].openRead()));
  // var length = await images[0].length();
  // var multipartFile = new http.MultipartFile('image', stream, length,
  //     filename: basename(images[0].path));
  for (int i = 0; i < images.length; i++) {
    var stream = new http.ByteStream(
        DelegatingStream.typed(images[i].openRead()));
    var length = await images[i].length();
    var multipartFile = new http.MultipartFile('images[$i]', stream, length,
        filename: basename(images[i].path));
    Demo.add(multipartFile);
  }
  //print("888888 $multipartFile");
  print("88888844 $Demo");
  var D = {"sub_category_id": '$sub_category_id', "title": '$title',
    "description": "$description",
    "city_id": "$city_id",
    "district_id": "$district_id",
    "price": "$price"

    //"images":images
  };
  print("pody is $D");
   //String T = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdmVuZG9yXC9sb2dpbiIsImlhdCI6MTYwOTM1ODc0OSwiZXhwIjoxNjA5NjE3OTQ5LCJuYmYiOjE2MDkzNTg3NDksImp0aSI6Im41TXF5NFRrMlJhWkh3TGkiLCJzdWIiOjMsInBydiI6IjkyM2E3Mzc1YjY1NmNhNWJiOWE3MjE2MjNmZTU5ZWI1ZjQ1MWYzZTkifQ.36kWI2HhZWEu8UsBT6F37O5K1FnHKdf7xCTv8i2TT2k';
  String T = sharedPrefs.getString('token');
  var uri = Uri.parse("https://amer.jit.sa/api/vendor/offer/store");
  var request = new http.MultipartRequest("POST", uri);
  request.headers.addAll(
      {HttpHeaders.authorizationHeader: T, "Accept": "application/json","Content-Type":"application/json"});
  request.fields.addAll(D);

  request.files.addAll(Demo);
  var response = await request.send();
  if (response.statusCode == 200) {
    print("Image Uploaded");
    return 'Success';
  } else {
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) async {
    Map valueMap = json.decode(value);
    // print(valueMap.toString());
    // print(_value1.toString());
    if (response.statusCode == 200) {
      Rsult = valueMap['data'][0].toString();
      return 'Success';
    } else {
      Rsult = valueMap['data'][0].toString();
      onBackPress(context, "${valueMap}");
      //Res = valueMap['data'][0].toString();
      return valueMap['data'][0].toString();
    }
  });
  // response.stream.transform(utf8.decoder).listen((value) {
  //   onBackPress(context,"$value");
  //   print(value);
  // });
}

  CreateOrder(List images, context,category_id,sub_category_id,title,description,city_id,district_id,price_from,price_to) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    //String T = sharedPrefs.getString('token');
    print(images.toString());
    List<http.MultipartFile> Demo = new List<http.MultipartFile>();
    // var stream = new http.ByteStream(DelegatingStream.typed(images[0].openRead()));
    // var length = await images[0].length();
    // var multipartFile = new http.MultipartFile('image', stream, length,
    //     filename: basename(images[0].path));
    for (int i = 0; i < images.length; i++) {
      var stream = new http.ByteStream(
          DelegatingStream.typed(images[i].openRead()));
      var length = await images[i].length();
      var multipartFile = new http.MultipartFile('images[$i]', stream, length,
          filename: basename(images[i].path));
      Demo.add(multipartFile);
    }
    //print("888888 $multipartFile");
    print("88888844 $Demo");
    var D = {"category_id": '$category_id', "sub_category_id": '$sub_category_id', "title": '$title',
      "description": "$description",
      "city_id": "$city_id",
      "district_id": "$district_id",
      "price_from": "$price_from",
      "price_to": "$price_to"
      //"images":images
    };
   // String T = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdXNlclwvbG9naW4iLCJpYXQiOjE2MDkzNDAzOTEsImV4cCI6MTYwOTU5OTU5MSwibmJmIjoxNjA5MzQwMzkxLCJqdGkiOiJyN1EzUmh3b3JOS2pxbjBsIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.j8HCdYpdO7MFJDGcdUInGER8XCoJ2nb_rSjEDpznLuU';
    String T = sharedPrefs.getString('token');
    var uri = Uri.parse("https://amer.jit.sa/api/user/order/store");
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll(
        {HttpHeaders.authorizationHeader: T, "Accept": "application/json","Content-Type":"application/json"});
    request.fields.addAll(D);

    request.files.addAll(Demo);
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
      return 'Success';
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) async {
      Map valueMap = json.decode(value);
      // print(valueMap.toString());
      // print(_value1.toString());
      if (response.statusCode == 200) {
        Rsult = valueMap['data'][0].toString();
        return 'Success';
      } else {
        Rsult = valueMap['data'][0].toString();
        onBackPress(context, "${valueMap}");
        //Res = valueMap['data'][0].toString();
        return valueMap['data'][0].toString();
      }
    });
    // response.stream.transform(utf8.decoder).listen((value) {
    //   onBackPress(context,"$value");
    //   print(value);
    // });
  }
  AddO(List images) async {
    List Demo = [];
    for (int i = 0; i < images.length; i++) {
      var stream = new http.ByteStream(
          DelegatingStream.typed(images[i].openRead()));
      var length = await images[i].length();
      var multipartFile = new http.MultipartFile('image', stream, length,
          filename: basename(images[i].path));
      Demo.add("$multipartFile");
    }
    print("im $images");
    var d = {"category_id": '1', "sub_category_id": '5', "title": 'test',
      "description": "description",
      "city_id": "1",
      "district_id": "8",
      "price_from": "250",
      "price_to": "5000",
      "images": Demo
    };

    String T = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW1lci5qaXQuc2FcL2FwaVwvdXNlclwvbG9naW4iLCJpYXQiOjE2MDkxODUyNDAsImV4cCI6MTYwOTE4ODg0MCwibmJmIjoxNjA5MTg1MjQwLCJqdGkiOiIwVnM1S3NFUVVSTGVLemp1Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.gGN_dSfZIccGFgh4ouBfcs1D9rWASlN1b5fKd4YPNm4";
    http.Response response = await http.post(
        'https://amer.jit.sa/api/user/order/store', body: d,
        headers: {
          HttpHeaders.authorizationHeader: T,
          "Accept": "application/json",
        });
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if (responsebody['status'] == 200) {
      return '$responsebody';
    } else {
      return '$responsebody';
    }
  }
  CreateAccount(imageFile, _controller, _controller3, _controller2,
      _controller4, _value1) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    String Res;
    var stream = new http.ByteStream(
        DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var D = {
      "username": '$_controller',
      "email": '$_controller3',
      "phone": '$_controller2',
      "password": "$_controller4",
      "city_id": "$_value1"
    };
    var uri = Uri.parse("https://amer.jit.sa/api/user/register");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));
    request.headers.addAll({
      HttpHeaders.authorizationHeader: "Bearer " + T,
      "Accept": "application/json"
    });
    request.files.add(multipartFile);
    request.fields.addAll(D);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) async {
      Map valueMap = json.decode(value);
      print(valueMap.toString());
      print(_value1.toString());
      if (response.statusCode == 200) {
        Rsult = valueMap['data'][0].toString();
        return valueMap['data'][0].toString();
      } else {
        Rsult = valueMap['data'][0].toString();
        Res = valueMap['data'][0].toString();
        return valueMap['data'][0].toString();
      }
    });
    print("sadsdasadsad------ $Res");
    return Res.toString();
  }
  Createorder(imageFile, List imagList) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String T = sharedPrefs.getString('token');
    Map Res;

    // var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // var length = await imageFile.length();
    var D = {"category_id": '1', "sub_category_id": '5', "title": 'sasaddsa',
      "description": "e.h.m775188@gmail.com",
      "price_from": "+96659335141488", "price_to": "+96659335141488",
      "district_id": "8",
      "city_id": "1"
    };
    var uri = Uri.parse("https://amer.jit.sa/api/user/order/store");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile;
    for (int i = 0; i < imagList.length; i++) {
      var stream = new http.ByteStream(
          DelegatingStream.typed(imagList[i].openRead()));
      var length = await imagList[i].length();
      multipartFile[i] = new http.MultipartFile('images', stream, length,
          filename: basename(imagList[i].path));
    }

    // var multipartFile = new http.MultipartFile('image', stream, length,
    //     filename: basename(imageFile.path));
    request.headers.addAll(
        {HttpHeaders.authorizationHeader: T, "Accept": "application/json"});
    // request.files.add(multipartFile);
    request.files.addAll(multipartFile);
    request.fields.addAll(D);
    var response = await request.send();
    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) async {
      var valueMap = json.decode(value);
      print(valueMap.toString());
      // if(response.statusCode == 200){
      //   print("Ssasa6656565");
      //   print(valueMap.toString());
      //   // final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      //   // Res = {};
      // }else{
      //   Res = valueMap['errors'];
      // }

    });
    //print("sadsdasadsad------ $Res");
    //return Res;
  }

  AddAPI(body, link) async {
    // Map<String, dynamic> d ={
    //   "branche_id":"${widget.branchId}",
    //   "user_id":"$UserId",
    //   "brand_id":"${widget.brandid}",
    //   "rates":send,
    //   "comment":"${commentEditingController.text}"
    // };
    http.Response response = await http.post('$link', body: json.encode(body),
        headers: {
          "Accept": "application/json",
          'Content-type': 'application/json',
        });
    print(response.body.toString());
    var responsebody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responsebody['data'];
    } else {
      print(response.statusCode.toString());
      return responsebody['data'];
    }
  }
