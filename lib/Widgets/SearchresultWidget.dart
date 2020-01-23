import 'package:flutter/material.dart';
import 'package:marvel_app/models/Charctermodel.dart';
import 'package:marvel_app/ui/Views/DetailCharcterView.dart';

class SearchItemWidget extends StatelessWidget {
  final String fullUrl;
  final String namecharacter;
  final String Description;
  List<ComicsItem> Itemscomics,ItemSeries,ItemEvents;
  List<StoriesItem>ItemStoereies;
  SearchItemWidget({this.fullUrl, this.namecharacter,
  this.Description,this.Itemscomics,this.ItemSeries,this.ItemStoereies,
  this.ItemEvents});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(onTap: (){
      Navigator.of(context).pushNamed(DetailCharcter.routname,arguments: {
        'name':namecharacter,
        'pathimage':fullUrl,
        'description':Description,
        'comics':Itemscomics,
        'series':ItemSeries,
        'stories':ItemStoereies,
        'events':ItemEvents
      });
    },child: Column(
      children: <Widget>[
        Container(
          color: Colors.black54,
          child: ListTile(
            contentPadding: EdgeInsets.all(0.0),
            leading: Image.network(
              fullUrl,
              width: 60.0,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            title: Text(
              namecharacter,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 0.5,
          child: Container(
            color: Colors.grey.withOpacity(0.1),
          ),
        )
      ],
    ),);
  }
}
