import 'package:flutter/material.dart';
import 'package:marvel_app/Widgets/TextDatawithWhitecolor.dart';
class ScotionWidget extends StatelessWidget
{
  final String Imagepathsection;
  final String name;
  ScotionWidget({this.Imagepathsection,this.name});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(width: 100.0,height: 160.0,child: Column(
      children: <Widget>[
        Image.network(
          Imagepathsection,
          width: 90.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        Text(name,style: TextStyle(color: Colors.white,fontSize: 6.0),)
      ],
    ),);
  }

}