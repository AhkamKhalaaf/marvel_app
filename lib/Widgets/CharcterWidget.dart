import 'package:flutter/material.dart';

class CharchterWidget extends StatelessWidget {
  final String fullUrl;
  final String namecharacter;

  CharchterWidget({this.fullUrl, this.namecharacter});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200.0,
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              image: fullUrl,
              placeholder: '',
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
                bottom: 30.0,
                left: 40.0,
                child:RotationTransition(child:Container(width: 180.0,
                  color: Colors.white,child:Text(namecharacter,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                      ,textAlign:TextAlign.center),),
                    turns: new AlwaysStoppedAnimation(0.99)))
          ],
        ));
  }
}
