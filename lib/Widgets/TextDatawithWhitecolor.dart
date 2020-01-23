import 'package:flutter/material.dart';
class TextDataWhitecolor extends StatelessWidget
{
  final String Datashowed;
  TextDataWhitecolor({this.Datashowed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(Datashowed,style: TextStyle(color: Colors.white ),);
  }

}