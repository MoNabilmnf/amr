import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//in C:\Program Files (x86)\Nox\bin adb.exe connect 127.0.0.1:62001
class BNBCustompain extends CustomPainter{
  Color color1 = colorFromHex("262b39");
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color1..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.40, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 0);
    path.arcToPoint(Offset(size.width*0.60,0),radius: Radius.circular(10.0),clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black,5,true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}