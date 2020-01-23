import 'package:flutter/material.dart';
class TextData extends StatelessWidget
{
  final String Datashowed;
  TextData({this.Datashowed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(Datashowed,style: TextStyle(color: Colors.red ),);
  }

}